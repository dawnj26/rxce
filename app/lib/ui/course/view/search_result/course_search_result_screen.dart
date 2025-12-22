import 'package:auto_route/auto_route.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/course/list/course_list_bloc.dart';
import 'package:rxce/router/router.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:rxce/shared/constants/constants.dart';
import 'package:rxce/shared/utils/utils.dart';
import 'package:rxce/ui/course/components/components.dart';

class CourseSearchResultScreen extends StatelessWidget {
  const CourseSearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            final query = context.select(
              (CourseListBloc bloc) => bloc.state.query,
            );

            return Text(query ?? 'Search Results');
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await context.router.push(
                CourseSearchRoute(
                  onFinished: (query) async {
                    await context.router.replace(
                      CourseSearchResultRoute(query: query),
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
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
                  Text('Results', style: textTheme.labelLarge),
                  Builder(
                    builder: (context) {
                      final state = context.watch<CourseListBloc>().state;

                      final activeFiltersCount =
                          (state.filterByTopic != null ? 1 : 0) +
                          (state.filterByType != null ? 1 : 0) +
                          (state.sortOption != CourseSortOption.liveFirst
                              ? 1
                              : 0);

                      return FilterButton(
                        activeFiltersCount: activeFiltersCount,
                        onPressed: () => _handleFilterTap(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<CourseListBloc, CourseListState>(
            builder: (context, state) {
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
                      itemBuilder: (context, index) =>
                          _buildCourseCard(context, index, state.courses),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
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
