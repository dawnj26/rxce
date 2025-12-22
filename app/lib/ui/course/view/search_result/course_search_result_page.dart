import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/ce/ce_bloc.dart';
import 'package:rxce/bloc/course/list/course_list_bloc.dart';
import 'package:rxce/ui/course/view/search_result/course_search_result_screen.dart';

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
      create: (context) {
        final ceRequirement = context.read<CeBloc>().state.ceRequirement;

        return CourseListBloc(
          coursePackage: context.read(),
          query: query,
          ceRequirement: ceRequirement,
        )..add(const CourseListEvent.started());
      },
      child: this,
    );
  }
}
