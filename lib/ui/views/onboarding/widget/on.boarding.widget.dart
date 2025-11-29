import 'package:streakit/z_animated_emoji/streak_animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

class OnboardingWidget extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final Color subtitleTextColor;
  final String animatedEmoji;

  const OnboardingWidget({
    super.key,
    required this.titleText,
    required this.subtitleText,
    required this.subtitleTextColor,
    required this.animatedEmoji,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedEmoji(
          animatedEmoji,
          size: 350,
          repeat: true,
        ),
        VerticalSpaceBox.s32,
        Text.rich(
          TextSpan(
            text: titleText,
            style: const TextStyle(color: AppColors.creamColor, fontSize: 20),
            children: [
              TextSpan(
                text: subtitleText,
                style: TextStyle(color: subtitleTextColor, fontSize: 20),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
