import 'package:app/ui/course/components/category_filter_list.dart';
import 'package:app/ui/course/components/course_type_filter_grid.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';

class CourseFilterModal extends StatefulWidget {
  const CourseFilterModal({
    super.key,
    this.selectedCategory,
    this.selectedType,
    this.onReset,
    this.onApply,
  });

  final CourseCategory? selectedCategory;
  final CourseType? selectedType;
  final void Function()? onReset;
  final void Function(CourseCategory? c, CourseType? t)? onApply;

  @override
  State<CourseFilterModal> createState() => _CourseFilterModalState();
}

class _CourseFilterModalState extends State<CourseFilterModal> {
  late CourseCategory? _category;
  late CourseType? _type;
  late final List<CourseCategory> _categories;

  @override
  void initState() {
    super.initState();

    _category = widget.selectedCategory;
    _type = widget.selectedType;
    _categories = CourseCategory.values;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).height;
    final desiredHeight = screenSize * 0.7;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: desiredHeight, // Adjust height as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              4,
              0,
              0,
            ),
            child: _FilterHeader(),
          ),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: colorScheme.onSurface,
                    tabs: const [
                      Tab(text: 'Categories'),
                      Tab(text: 'Type'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        CategoryFilterList(
                          categories: _categories,
                          selected: _category,
                          onSelected: (category) {
                            setState(() {
                              _category = category;
                            });
                          },
                        ),
                        CourseTypeFilterGrid(
                          selected: _type,
                          onSelected: (type) {
                            setState(() {
                              _type = type;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              16,
            ),
            child: _FilterFooter(
              onReset: widget.onReset,
              onApply: () => widget.onApply?.call(_category, _type),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterFooter extends StatelessWidget {
  const _FilterFooter({this.onApply, this.onReset});

  final VoidCallback? onReset;
  final VoidCallback? onApply;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onReset,
            child: const Text('Reset'),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: FilledButton(
            onPressed: onApply,
            child: const Text('Apply'),
          ),
        ),
      ],
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Filter courses',
          style: textTheme.titleSmall,
        ),
        IconButton(
          iconSize: 16,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
