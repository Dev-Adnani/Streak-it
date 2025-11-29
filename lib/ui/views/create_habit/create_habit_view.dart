import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:stacked/stacked.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:streakit/ui/common/app.text.theme.dart';
import 'package:streakit/ui/common/ui_helpers.dart';
import 'package:streakit/ui/views/create_habit/widget/color_selector/color_selector.dart';
import 'package:streakit/ui/views/create_habit/widget/drop_downs/habit_category.dart';
import 'package:streakit/ui/views/create_habit/widget/drop_downs/reminder_days.dart';
import 'package:streakit/ui/views/create_habit/widget/icon_selector/icon_selector.dart';
import 'package:streakit/ui/views/create_habit/widget/number_inc_dec/number_inc_dec.dart';
import 'package:streakit/ui/views/create_habit/widget/drop_downs/time_interval.dart';
import 'package:streakit/ui/widget/custom_app_bar.dart';
import 'package:streakit/ui/widget/custom_text_field.dart';
import 'package:toasty_box/toast_service.dart';
import 'create_habit_viewmodel.dart';

class CreateHabitView extends StackedView<CreateHabitViewModel> {
  final Habit? habit;
  const CreateHabitView({super.key, this.habit});

  @override
  Widget builder(
    BuildContext context,
    CreateHabitViewModel viewModel,
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

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(
        title: habit != null ? "Edit Habit" : "Create Habit",
        iconData: IconlyLight.arrowLeft2,
        iconColor: AppColors.iceBlue,
        onPressed: () {
          viewModel.goBack();
        },
        children: [
          IconButton(
            onPressed: () {
              if (habit != null) {
                viewModel.updateHabit();
              } else {
                viewModel.createHabit();
              }
            },
            icon: const Icon(
              Icons.check,
              color: AppColors.iceBlue,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        reverse: true,
        controller: viewModel.scrollController,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpaceBox.s16,
                  Text(
                    "Basic Details",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.iceBlue,
                    ),
                  ),
                  VerticalSpaceBox.s16,
                  CustomTextField.customTextFieldTwo(
                    textEditingController: viewModel.nameController,
                    hintText: "Enter Name",
                    labelText: "Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  VerticalSpaceBox.s16,
                  CustomTextField.customTextFieldTwo(
                    textEditingController: viewModel.descriptionController,
                    hintText: "Enter Description",
                    labelText: "Description",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description cannot be empty";
                      }
                      return null;
                    },
                  ),
                  VerticalSpaceBox.s16,
                  TimeInterval(
                    intervalType: viewModel.intervalType ?? "",
                    onIntervalSelected: (p0) => viewModel.setIntervalType(p0),
                  ),
                  VerticalSpaceBox.s16,
                  NumberIncDec(
                    info: viewModel.intervalType ?? "",
                    value: viewModel.completionGoalValue,
                    onIncrease: () {
                      if (viewModel.completionGoalValue < 10) {
                        viewModel.completionGoalValue++;
                      }
                    },
                    onDecrease: () {
                      if (viewModel.completionGoalValue > 1) {
                        viewModel.completionGoalValue--;
                      }
                    },
                  ),
                  VerticalSpaceBox.s16,
                  HabitCategoryDropDown(
                    onListChanged: (p0) => viewModel.setHabitCategory(p0),
                    habitCategoryMultiSelectController:
                        viewModel.habitCategoryMultiSelectController,
                  ),
                  VerticalSpaceBox.s16,
                  Text(
                    "Reminder",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.iceBlue,
                    ),
                  ),
                  VerticalSpaceBox.s12,
                  ReminderDays(
                    onListChanged: (p0) => viewModel.setReminderDays(p0),
                    reminderMultiSelectController:
                        viewModel.reminderMultiSelectController,
                  ),
                  VerticalSpaceBox.s16,
                  CustomTextField.customTextFieldTwo(
                    textEditingController: viewModel.timeField,
                    hintText: "Enter Time",
                    labelText: viewModel.timeLabel,
                    readOnly: true,
                    onTap: () {
                      viewModel.selectTime(context: context);
                    },
                    prefixIcon: IconlyLight.timeCircle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Time cannot be empty";
                      }
                      return null;
                    },
                  ),
                  VerticalSpaceBox.s16,
                  Text(
                    "Colors & Icons",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.iceBlue,
                    ),
                  ),
                  colorSelector(
                    selectedIndex: viewModel.selectedColorIndex,
                    onColorSelected: (index) {
                      viewModel.setSelectedColorIndex(colorIndex: index);
                    },
                  ),
                  VerticalSpaceBox.s16,
                  IconSelector(
                    selectedColor: viewModel.selectedColor,
                    onIconSelected: (iconName) {
                      viewModel.setSelectedIconName(iconName: iconName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CreateHabitViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateHabitViewModel(
        oldHabit: habit,
      );
}
