import 'package:app/ui/components/select_card.dart';
import 'package:app/ui/course/components/category_filter_list.dart';
import 'package:app/ui/course/components/course_type_filter_grid.dart';
import 'package:app/ui/course/models/sort_option.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';

class CourseFilterModal extends StatefulWidget {
  const CourseFilterModal({
    super.key,
    this.selectedCategory,
    this.selectedType,
    this.onReset,
    this.onApply,
    this.selectedSortOption = SortOption.aToZliveFirst,
  });

  final CourseCategory? selectedCategory;
  final CourseType? selectedType;
  final SortOption selectedSortOption;
  final void Function()? onReset;
  final void Function(CourseCategory? c, CourseType? t, SortOption s)? onApply;

  @override
  State<CourseFilterModal> createState() => _CourseFilterModalState();
}

class _CourseFilterModalState extends State<CourseFilterModal> {
  late CourseCategory? _category;
  late CourseType? _type;
  late SortOption _sortOption;
  late final List<CourseCategory> _categories;

  @override
  void initState() {
    super.initState();

    _category = widget.selectedCategory;
    _type = widget.selectedType;
    _categories = CourseCategory.values;
    _sortOption = widget.selectedSortOption;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).height;
    final desiredHeight = screenSize * 0.7;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: desiredHeight,
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
            length: 3,
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: colorScheme.onSurface,
                    tabs: const [
                      Tab(text: 'Categories'),
                      Tab(text: 'Type'),
                      Tab(text: 'Sort'),
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
                              if (_category == category) {
                                _category = null;
                              } else {
                                _category = category;
                              }
                            });
                          },
                        ),
                        CourseTypeFilterGrid(
                          selected: _type,
                          onSelected: (type) {
                            setState(() {
                              if (_type == type) {
                                _type = null;
                              } else {
                                _type = type;
                              }
                            });
                          },
                        ),
                        Builder(
                          builder: (c) {
                            const sortOptions = SortOption.values;

                            return ListView.builder(
                              padding: const EdgeInsets.fromLTRB(
                                12,
                                12,
                                12,
                                12,
                              ),
                              itemBuilder: (c, i) {
                                final sortOption = sortOptions[i];
                                final isSelected = _sortOption == sortOption;

                                return SelectCard(
                                  isSelected: isSelected,
                                  child: Text(sortOption.label),
                                  onTap: () {
                                    setState(() {
                                      _sortOption = sortOption;
                                    });
                                  },
                                );
                              },
                              itemCount: sortOptions.length,
                            );
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
              onApply: () =>
                  widget.onApply?.call(_category, _type, _sortOption),
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
