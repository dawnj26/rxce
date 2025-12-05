import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/shared/formatter.dart';
import 'package:rxce/ui/course/components/components.dart';

class CourseItemCard extends StatelessWidget {
  const CourseItemCard({
    required this.course,
    this.onTap,
    super.key,
  });

  final CourseItem course;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        const aspectRatio = 1 / 2;
        final minHeight = constraints.maxWidth * aspectRatio;

        return Card(
          clipBehavior: Clip.hardEdge,
          color: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: colorScheme.outlineVariant,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: minHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CourseItemHeader(course: course),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child: _CourseDescription(
                            description: course.description,
                          ),
                        ),
                        _CardFooter(course: course),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: _Ceu(
                    ceus: course.ceus,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Ceu extends StatelessWidget {
  const _Ceu({
    required this.ceus,
  });

  final double ceus;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
        ),
      ),
      child: Text(
        'CEUs: $ceus',
        style: textTheme.bodySmall?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CourseDescription extends StatelessWidget {
  const _CourseDescription({
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      description,
      style: textTheme.bodySmall,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _CardFooter extends StatelessWidget {
  const _CardFooter({
    required this.course,
  });

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (!course.isLive) {
      return const SizedBox.shrink();
    }

    final text = 'Registration opens: ${formatDate(course.startDate)}';

    return Text(
      text,
      style: textTheme.bodySmall?.copyWith(
        color: colorScheme.primary,
      ),
    );
  }
}

class _CourseItemHeader extends StatelessWidget {
  const _CourseItemHeader({
    required this.course,
  });

  final CourseItem course;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(text: course.title, style: textTheme.titleSmall),
        ),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 4,
          children: [
            CourseTypeBadge(type: course.courseType),
            const SizedBox(width: 8),
            DifficultyBadge(level: course.difficultyLevel),
            if (course.isFree) ...[
              const SizedBox(width: 8),
              FreeBadge(
                membersOnly: course.isFreeForMembers,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
