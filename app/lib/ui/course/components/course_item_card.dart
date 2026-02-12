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
    const cardHeight = 232.0;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: context.appColor.neutral.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.zero,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: cardHeight,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: .end,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            const _Reviews(stars: 5, reviewCount: 120),
            const SizedBox(height: 4),
            Text(
              course.difficultyLevel.label,
              style: context.appText.labelMedium.copyWith(
                color: context.appColor.neutral.shade500,
              ),
            ),
          ],
        ),
        CeuBadge(ceus: course.credits),
      ],
    );
  }
}

class _Reviews extends StatelessWidget {
  const _Reviews({
    required this.reviewCount,
    required this.stars,
  });

  final double stars;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '★ ${stars.toStringAsFixed(1)}',
        style: context.appText.labelMedium.copyWith(
          color: context.appColor.neutral.shade950,
        ),
        children: [
          TextSpan(
            text: ' ($reviewCount reviews)',
            style: context.appText.labelMedium.copyWith(
              color: context.appColor.neutral.shade500,
            ),
          ),
        ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 24,
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              CourseTypeBadge(type: course.courseType),
              if (course.isFreeForMembers) const FreeBadge(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          course.testName,
          style: context.appText.heading6.copyWith(
            color: context.appColor.primary.shade900,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
