import 'package:auto_route/auto_route.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/ce/ce_bloc.dart';
import 'package:rxce/bloc/course/list/course_list_bloc.dart';
import 'package:rxce/router/router.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:rxce/shared/constants/constants.dart';
import 'package:rxce/shared/utils/modals.dart';
import 'package:rxce/ui/course/components/components.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () => _handleSearchTap(context),
            icon: const Icon(Icons.search),
          ),
        ],
        bottom: const _CeFilter(),
      ),
      body: ScrollListener(
        onScrollEnd: () => context.read<CourseListBloc>().add(
          const CourseListEvent.loadMore(),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All Courses', style: textTheme.labelLarge),
                  _Filter(
                    onFilterTap: () => _handleFilterTap(context),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<CourseListBloc, CourseListState>(
            builder: _buildCourseList,
          ),
        ],
      ),
    );
  }

  Future<void> _handleSearchTap(BuildContext context) async {
    await context.router.push(
      CourseSearchRoute(
        onFinished: (query) async {
          await context.router.replace(
            CourseSearchResultRoute(query: query),
          );
        },
      ),
    );
  }

  Widget _buildCourseList(
    BuildContext context,
    CourseListState state,
  ) {
    switch (state.status) {
      case LoadingStatus.initial || LoadingStatus.loading:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        );
      case LoadingStatus.failure:
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Error: ${state.errorMessage}')),
        );
      case LoadingStatus.success:
        if (state.courses.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('No courses available')),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverList.builder(
            itemCount: state.hasReachedMax
                ? state.courses.length
                : state.courses.length + 1,
            itemBuilder: (context, index) => _buildCourseCard(
              context,
              index,
              state.courses,
            ),
          ),
        );
    }
  }

  Widget _buildCourseCard(
    BuildContext context,
    int index,
    List<CourseItem> courses,
  ) {
    if (index >= courses.length) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final course = courses[index];
    return CourseItemCard(
      course: course,
      onTap: () {},
    );
  }

  Future<void> _handleFilterTap(BuildContext context) async {
    final categoryFilter = context.read<CourseListBloc>().state.filterByTopic;
    final typeFilter = context.read<CourseListBloc>().state.filterByType;
    final sortOption = context.read<CourseListBloc>().state.sortOption;

    await showCourseFilterModal(
      context: context,
      categoryFilter: categoryFilter,
      typeFilter: typeFilter,
      sortOption: sortOption,
      onReset: () {
        Navigator.of(context).pop();
        context.read<CourseListBloc>().add(
          const CourseListEvent.filterChanged(),
        );
      },
      onApply: (category, type, sort) {
        Navigator.of(context).pop();
        context.read<CourseListBloc>().add(
          CourseListEvent.filterChanged(
            filterByTopic: category,
            filterByType: type,
            sortOption: sort,
          ),
        );
      },
    );
  }
}

class _CeFilter extends StatelessWidget implements PreferredSizeWidget {
  const _CeFilter();

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ceRequirement = context.select<CeBloc, CeRequirement?>(
      (bloc) => bloc.state.ceRequirement,
    );

    final rPad = ceRequirement != null ? 0.0 : 16.0;

    return Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(16, 8, rPad, 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CeSelectorBar(
              ceRequirement: ceRequirement,
              onTap: () => _handleCeRequirementTap(context, ceRequirement),
            ),
          ),
          if (ceRequirement != null)
            IconButton(
              onPressed: () {
                context.read<CeBloc>().add(
                  const CeEvent.changed(null),
                );
              },
              icon: const Icon(Icons.close, size: 16),
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(4),
                fixedSize: const Size(24, 24),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleCeRequirementTap(
    BuildContext context,
    CeRequirement? ceRequirement,
  ) async {
    final state = await showStateSelectionSheet(
      context,
      currentSelection: ceRequirement?.state,
    );

    // Delay to allow bottom sheet to close smoothly
    await Future<void>.delayed(
      const Duration(milliseconds: 200),
    );

    if (!context.mounted || state == null) return;

    final profession = await showProfessionSelectionSheet(
      context,
      currentSelection: ceRequirement?.profession,
    );

    if (!context.mounted || profession == null) return;

    context.read<CeBloc>().add(
      CeEvent.changed(
        CeRequirement(
          state: state,
          profession: profession,
        ),
      ),
    );
  }
}

class _Filter extends StatelessWidget {
  const _Filter({required this.onFilterTap});

  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CourseListBloc>().state;

    final activeFiltersCount =
        (state.filterByTopic != null ? 1 : 0) +
        (state.filterByType != null ? 1 : 0) +
        (state.sortOption != CourseSortOption.liveFirst ? 1 : 0);

    return FilterButton(
      activeFiltersCount: activeFiltersCount,
      onPressed: onFilterTap,
    );
  }
}
