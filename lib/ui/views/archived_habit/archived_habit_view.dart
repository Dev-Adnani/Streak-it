import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/views/archived_habit/widget/custom_habit_archive_view.dart';
import 'package:streakit/ui/views/archived_habit/widget/shimmer_archived_habit.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:toasty_box/toast_service.dart';

import 'archived_habit_viewmodel.dart';

class ArchivedHabitView extends StackedView<ArchivedHabitViewModel> {
  const ArchivedHabitView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ArchivedHabitViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        title: "Archived Habits",
        iconData: IconlyLight.arrowLeft,
        iconColor: AppColors.iceBlue,
        onPressed: () {
          viewModel.goBack();
        },
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            StreamBuilder(
              stream: viewModel.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ShimmerHabitArchiveView();
                      },
                      childCount: 5,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "Error fetching archived habits",
                        style: AppTextStyles.titleLarge,
                      ),
                    ),
                  );
                }
                if (snapshot.data?.isEmpty ?? true) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "No archived habits",
                        style: AppTextStyles.titleLarge,
                      ),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final habit = snapshot.data?[index];
                      return CustomHabitArchiveView(
                        habitName: habit?.habitName ?? "Untitled Habit",
                        habitDescription: habit?.habitDescription,
                        icon: habit?.icon,
                        onUnarchiveTap: () async {
                          String result = await viewModel.changeHabitStatus(
                            habit: habit,
                          );

                          if (result == "error") {
                            ToastService.showToast(
                              // ignore: use_build_context_synchronously
                              context,
                              backgroundColor: AppColors.blackColor,
                              shadowColor: AppColors.iceBlue.withValues(
                                alpha: 0.2,
                              ),
                              message: "Error changing habit status",
                              messageStyle: AppTextStyles.titleLarge,
                            );
                          }
                        },
                        onDeleteTap: () {
                          if (habit != null) {
                            viewModel.showDeleteAccountDialog(
                              context: context,
                              habit: habit,
                            );
                          } else {
                            ToastService.showErrorToast(
                              context,
                              message: "Error deleting habit",
                            );
                          }
                        },
                      );
                    },
                    childCount: snapshot.data?.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  ArchivedHabitViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ArchivedHabitViewModel();
}
