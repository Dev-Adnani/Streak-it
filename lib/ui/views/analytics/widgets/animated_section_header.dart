import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.text.theme.dart';

/// Animated Section Header
class AnimatedSectionHeader extends StatelessWidget {
  final String title;

  const AnimatedSectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: AppTextStyles.headlineMedium,
            ),
          ),
        );
      },
    );
  }
}
