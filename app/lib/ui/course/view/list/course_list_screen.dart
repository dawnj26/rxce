import 'package:app/bloc/course/course_list_bloc.dart';
import 'package:app/shared/loading_status.dart';
import 'package:app/ui/components/filter_button.dart';
import 'package:app/ui/components/scroll_listener.dart';
import 'package:app/ui/course/components/components.dart';
import 'package:app/ui/course/components/course_filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ScrollListener(
        onLoadMore: () => context.read<CourseListBloc>().add(
          const CourseListEvent.loadMore(),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilterButton(
                    activeFiltersCount: 0,
                    onPressed: () async {
                      const double borderRadius = 12;
                      final categoryFilter = context
                          .read<CourseListBloc>()
                          .state
                          .filterByTopic;
                      final typeFilter = context
                          .read<CourseListBloc>()
                          .state
                          .filterByType;

                      await showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(borderRadius),
                            topRight: Radius.circular(borderRadius),
                          ),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext _) {
                          return CourseFilterModal(
                            selectedCategory: categoryFilter,
                            selectedType: typeFilter,
                            onReset: () {
                              Navigator.pop(context);
                              context.read<CourseListBloc>().add(
                                const CourseListEvent.filterChanged(),
                              );
                            },
                            onApply: (c, t) {
                              Navigator.pop(context);
                              context.read<CourseListBloc>().add(
                                CourseListEvent.filterChanged(
                                  filterByTopic: c,
                                  filterByType: t,
                                ),
                              );
                            },
                          );
                        },
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
                      itemBuilder: (context, index) {
                        if (index >= state.courses.length) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final course = state.courses[index];
                        return CourseItemCard(
                          course: course,
                          onTap: () {},
                        );
                      },
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
