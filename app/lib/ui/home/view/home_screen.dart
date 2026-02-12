import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:rxce/ui/course/components/course_item_card.dart';
import 'package:theme_package/theme_package.dart';

final announcements = [
  AnnouncementCard(
    title: 'New Features',
    description: 'Check out the latest features we have added to the app!',
    variant: AnnouncementVariant.primary,
    onTap: () {},
  ),
  AnnouncementCard(
    title: 'Maintenance Update',
    description:
        'Scheduled maintenance on Saturday, '
        'June 15th from 1 AM to 3 AM.',
    onTap: () {},
  ),
  AnnouncementCard(
    title: 'Community Event',
    description: 'Join us for a community event this weekend!',
    variant: AnnouncementVariant.tertiary,
    onTap: () {},
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const padding = ThemePackage.padding;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            title: AppLogo(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(padding),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Explore',
                style: context.appText.heading5.copyWith(
                  fontVariations: [
                    const FontVariation('wght', 500),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: _AnnouncementCarousel(),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(padding, 8, padding, 8),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Courses',
                    style: context.appText.heading5.copyWith(
                      fontVariations: [
                        const FontVariation('wght', 500),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: context.appText.labelMedium.copyWith(
                        fontVariations: [
                          const FontVariation('wght', 500),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            sliver: SliverList.builder(
              itemBuilder: (ctx, i) {
                final course = courses[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CourseItemCard(
                    course: course,
                    onTap: () {},
                  ),
                );
              },
              itemCount: courses.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementCarousel extends StatefulWidget {
  const _AnnouncementCarousel();

  @override
  State<_AnnouncementCarousel> createState() => _AnnouncementCarouselState();
}

class _AnnouncementCarouselState extends State<_AnnouncementCarousel> {
  final _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: announcements.length,
          itemBuilder: (ctx, i, pageViewIndex) {
            return announcements[i];
          },
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            announcements.length,
            (index) {
              final selected = index == _currentIndex;

              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected
                        ? context.appColor.primary.shade500
                        : context.appColor.neutral.shade300,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
