import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/ui/common/app.assets.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/utils/check_curr_date.dart';
import 'package:streakit/ui/utils/generate_color_sets.dart';
import 'package:streakit/ui/views/home/widget/calender_ui.dart';
import 'package:streakit/ui/views/home/widget/custom_completor.dart';
import 'package:streakit/ui/views/home/widget/popup_habit.dart';
import 'package:toasty_box/toast_service.dart';

import 'streak_ui_viewmodel.dart';

class MonthStreakView extends StackedView<StreakUiViewModel> {
  final Habit? habit;
  final Map<DateTime, int>? datasets;
  final Color color;
  final VoidCallback? onDatasetsUpdated;

  const MonthStreakView({
    this.habit,
    required this.color,
    this.datasets,
    this.onDatasetsUpdated,
    super.key,
  });

  @override
  Widget builder(
    BuildContext context,
    StreakUiViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.errorText != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ToastService.showErrorToast(
          context,
          message: viewModel.errorText ?? " ",
        );
        viewModel.clearError();
      });
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.4),
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          VerticalSpaceBox.s5,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                habit?.icon ?? AppIconPack.ASSETS_ICON_PACK_ARCHIVE_SVG,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
              HorizontalSpaceBox.s8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit?.habitName ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.titleLarge.copyWith(
                        height: 1.0,
                      ),
                    ),
                    VerticalSpaceBox.s2,
                    Text(
                      habit?.habitDescription ?? "",
                      style: AppTextStyles.bodyText5,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      // Use StatefulBuilder to enable state updates inside the BottomSheet
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return StreakCalender(
                            datasets: datasets,
                            color: color,
                            updateCompletion: (completion) async {
                              bool check =
                                  await viewModel.currentHabitCompletions(
                                      habitId: habit?.habitId ?? "");
                              if (check) {
                                // Update datasets via ViewModel or directly
                                viewModel.updateCompletion(
                                  habit?.habitId ?? "",
                                  completion,
                                  habit?.completionsPerInterval ?? 1,
                                );

                                setState(() {
                                  datasets?[completion] =
                                      (datasets?[completion] ?? 0) + 1;
                                });

                                // Optionally notify the parent widget
                                if (onDatasetsUpdated != null) {
                                  onDatasetsUpdated!();
                                }
                              }
                            },
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    IconlyLight.calendar,
                    color: AppColors.creamColor,
                  ),
                ),
              ),
              HorizontalSpaceBox.s8,
              GestureDetector(
                onTap: () {
                  viewModel.updateCompletion(
                    habit?.habitId ?? "",
                    DateTime.now(),
                    habit?.completionsGoal ?? 1,
                  );
                },
                child: CompletionWidget(
                  completion: checkCurrDate(datasets),
                  total: habit?.completionsGoal ?? 1,
                  size: 30,
                  completedColor: color,
                ),
              ),
              PopupHabit(
                onArchiveTap: () async {
                  String data =
                      await viewModel.archiveHabit(habit: habit ?? Habit());
                  if (data == "error") {
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
                onEditTap: () {
                  viewModel.editHabit(habit: habit);
                },
              ),
            ],
          ),
          VerticalSpaceBox.s8,
          HeatMap(
            defaultColor: color.withValues(alpha: 0.2),
            startDate: DateTime.now().subtract(const Duration(days: 180)),
            borderRadius: 2,
            size: 10,
            datasets: datasets,
            colorMode: ColorMode.color,
            showText: false,
            scrollable: true,
            colorsets:
                generateColorSets(habit?.completionsPerInterval ?? 1, color),
            showColorTip: false,
          ),
        ],
      ),
    );
  }

  @override
  StreakUiViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StreakUiViewModel();
}
