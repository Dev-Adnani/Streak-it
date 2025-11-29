import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/local/cache_keys.dart';
import 'package:streakit/local/cache_manager.dart';
import 'package:streakit/ui/views/onboarding/widget/on.boarding.widget.dart';
import '../../../z_animated_emoji/streak_animated_emoji.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: OnBoardingSlider(
      onFinish: () {
        CacheManager.setBool(key: CacheKeys.onBoardingKey, value: true);
        viewModel.navigateToSignUp();
      },
      headerBackgroundColor: AppColors.blackColor,
      pageBackgroundColor: AppColors.blackColor,
      hasSkip: true,
      skipTextButton: Text(
        "Skip",
        style: const TextStyle(
          color: AppColors.blackColor,
        ),
      ),
      finishButtonText: 'Register',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.yellowish,
      ),
      trailing: const SizedBox(),
      background: const [
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: const [
        OnboardingWidget(
          titleText: "Welcome, Streak Seeker!",
          subtitleText: "\n Get ready to soar to new heights",
          animatedEmoji: AnimatedEmojis.dragon,
          subtitleTextColor: AppColors.greenish,
        ),
        OnboardingWidget(
          titleText: "Unleash your inner gorilla",
          subtitleText: "\n and dominate your goals like a beast!",
          animatedEmoji: AnimatedEmojis.gorilla,
          subtitleTextColor: AppColors.icePink,
        ),
        OnboardingWidget(
          titleText: "Embrace your inner shark",
          subtitleText: "\n and dive into your goals with killer focus!",
          animatedEmoji: AnimatedEmojis.shark,
          subtitleTextColor: AppColors.iceBlue,
        ),
      ],
    ));
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
