import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'leaderboard_viewmodel.dart';

class LeaderboardView extends StackedView<LeaderboardViewModel> {
  const LeaderboardView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LeaderboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
    );
  }

  @override
  LeaderboardViewModel viewModelBuilder(BuildContext context) =>
      LeaderboardViewModel();
}
