import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:theme_package/theme_package.dart';

enum AnnouncementVariant {
  primary,
  secondary,
  tertiary,
}

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    required this.title,
    required this.description,
    super.key,
    this.variant = AnnouncementVariant.secondary,
    this.onTap,
  });

  final AnnouncementVariant variant;
  final String title;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = switch (variant) {
      AnnouncementVariant.primary => context.appColor.primary,
      AnnouncementVariant.secondary => context.appColor.secondary,
      AnnouncementVariant.tertiary => context.appColor.tertiary,
    };

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: color.shade50,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              Positioned(
                right: 16,
                top: -72,
                child: Circle(size: 128, color: color.shade700),
              ),
              Positioned(
                right: -80,
                top: -56,
                child: Circle(size: 144, color: color.shade600),
              ),
              Positioned(
                right: -24,
                bottom: -40,
                child: Circle(size: 80, color: color.shade600),
              ),
              // Content on top
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            title,
                            style: context.appText.heading4.copyWith(
                              fontVariations: [
                                const FontVariation('wght', 500),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: context.appText.paragraphSmall.copyWith(
                              color: color.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.arrowRight,
                          color: color.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: InkWell(
                  onTap: onTap, // Move your onTap here
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
