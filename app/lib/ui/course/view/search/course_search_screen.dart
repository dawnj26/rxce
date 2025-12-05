import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/course/search/course_search_bloc.dart';
import 'package:rxce/shared/loading_status.dart';
import 'package:rxce/ui/course/components/components.dart';

class CourseSearchScreen extends StatefulWidget {
  const CourseSearchScreen({super.key, this.onFinished});

  final void Function(String query)? onFinished;

  @override
  State<CourseSearchScreen> createState() => _CourseSearchScreenState();
}

class _CourseSearchScreenState extends State<CourseSearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search courses...',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            if (value.isEmpty) {
              _focusNode.unfocus();
              return;
            }

            context.router.pop();
            widget.onFinished?.call(value);
          },
          onChanged: (value) {
            context.read<CourseSearchBloc>().add(
              CourseSearchEvent.queryChanged(value),
            );
          },
        ),
        actions: [
          Builder(
            builder: (c) {
              final query = c.select(
                (CourseSearchBloc bloc) => bloc.state.query,
              );

              if (query.isEmpty) {
                return const SizedBox.shrink();
              }

              return IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.text = '';
                  context.read<CourseSearchBloc>().add(
                    const CourseSearchEvent.queryChanged(''),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CourseSearchBloc, CourseSearchState>(
        builder: (context, state) {
          switch (state.status) {
            case LoadingStatus.initial:
              return const Center(
                child: Text('Start typing to search courses.'),
              );
            case LoadingStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.success:
              if (state.suggestions.isEmpty) {
                return const Center(child: Text('No suggestions found.'));
              }

              return ListView.builder(
                itemCount: state.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = state.suggestions[index];

                  return SearchSuggestionTile(
                    suggestion: suggestion,
                    onTap: () {
                      context.router.pop();
                      widget.onFinished?.call(suggestion);
                    },
                  );
                },
              );
            case LoadingStatus.failure:
              return Center(child: Text('Error: ${state.errorMessage}'));
          }
        },
      ),
    );
  }
}
