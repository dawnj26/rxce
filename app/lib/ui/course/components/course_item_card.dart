import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/course/components/components.dart';
import 'package:theme_package/theme_package.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        const aspectRatio = 1 / 2;
        final minHeight = constraints.maxWidth * aspectRatio;

        return Card(
          clipBehavior: Clip.hardEdge,
          color: context.appColor.neutral.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
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
                    ceus: course.credits,
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
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.appColor.primary.shade500,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$ceus CEU',
        style: context.appText.labelMedium.copyWith(
          color: context.appColor.primary.shade50,
          fontWeight: FontWeight.w600,
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
    return Text(
      description,
      style: context.appText.paragraphSmall.copyWith(
        color: context.appColor.neutral.shade500,
      ),
      maxLines: 2,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          course.difficultyLevel.label,
          style: context.appText.labelMedium.copyWith(
            color: context.appColor.neutral.shade500,
          ),
        ),
        _Ceu(ceus: course.credits),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            CourseTypeBadge(type: course.courseType),
            const SizedBox(width: 8),
            DifficultyBadge(level: course.difficultyLevel),
          ],
        ),
      ],
    );
  }
}
