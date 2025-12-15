import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/course/search/course_search_bloc.dart';

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
            final v = value.trim();

            if (v.isEmpty) {
              _focusNode.unfocus();
              return;
            }

            context.router.pop();
            widget.onFinished?.call(value);
          },
          onChanged: (value) {
            context.read<CourseSearchBloc>().add(
              CourseSearchEvent.queryChanged(value.trim()),
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
      body: const Center(
        child: Text('Start typing to search courses.'),
      ),
    );
  }
}
