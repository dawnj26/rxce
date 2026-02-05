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
          color: context.appColor.neutral.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          child: InkWell(
            onTap: onTap,
            child: ConstrainedBox(
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
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
                      child: _CourseDescription(
                        description: course.description,
                      ),
                    ),
                    _CardFooter(course: course),
                  ],
                ),
              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
            if (course.isFreeForMembers) const FreeBadge(),
          ],
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: '${course.testName}\n',
            style: context.appText.heading6.copyWith(
              color: context.appColor.primary.shade900,
            ),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
