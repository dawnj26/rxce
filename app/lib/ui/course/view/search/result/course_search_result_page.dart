import 'package:app/bloc/course/course_list_bloc.dart';
import 'package:app/ui/course/view/search/result/course_search_result_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CourseSearchResultPage extends StatelessWidget
    implements AutoRouteWrapper {
  const CourseSearchResultPage({required this.query, super.key});

  final String query;

  @override
  Widget build(BuildContext context) {
    return const CourseSearchResultScreen();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CourseListBloc(coursePackage: context.read(), query: query)
            ..add(const CourseListEvent.started()),
      child: this,
    );
  }
}
