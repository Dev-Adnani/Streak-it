import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/z_animated_emoji/streak_animated_emoji.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/ui_helpers.dart';

import 'splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AnimatedEmoji(
                AnimatedEmojis.electricity,
                size: 128,
                repeat: true,
              ),
              VerticalSpaceBox.s16,
              const Text(
                "Streaks on Fleek",
                style: TextStyle(
                  color: AppColors.creamColor,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();
}
