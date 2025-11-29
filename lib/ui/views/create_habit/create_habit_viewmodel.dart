import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/local/habit_constants.dart';
import 'package:streakit/local/plans.dart';
import 'package:streakit/repository/habit_repository.dart';
import 'package:streakit/services/notification_service.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/ui/common/app.assets.dart';
import 'package:streakit/ui/common/app.colors.dart';
import 'package:uuid/uuid.dart';

class CreateHabitViewModel extends BaseViewModel {
  final Habit? oldHabit;

  CreateHabitViewModel({this.oldHabit}) {
    if (oldHabit != null) {
      nameController.text = oldHabit?.habitName ?? "";
      descriptionController.text = oldHabit?.habitDescription ?? "";
      completionGoal = oldHabit?.completionsGoal ?? 1;
      _selectedIconName = oldHabit?.icon ?? AppIconPack.iconPack.first;

      _selectedColorIndex =
          AppColors.getColorIndexByName(oldHabit?.heatMapColor);
      _intervalType = oldHabit?.intervalType ?? "Day";
      _reminderDays = oldHabit?.reminderDays ?? [];
      selectedTime = oldHabit?.reminderTime ?? DateTime.now();
      timeField.text = formatTime(
          oldHabit?.reminderTime.toString() ?? DateTime.now().toString());
      timeLabel = "Time";

      // match items of habit category if it exists HabitConstants.habitCategories , if yes then add it to habitCategoryMultiSelectController
      for (var element in HabitConstants.habitCategories) {
        if (oldHabit?.categories?.contains(element.name) ?? false) {
          habitCategoryMultiSelectController?.add(element.name);
        }
      }

      // match items of reminder days if it exists HabitConstants.weekDays , if yes then add it to reminderMultiSelectController
      for (var element in HabitConstants.weekDays) {
        if (oldHabit?.reminderDays?.contains(element) ?? false) {
          reminderMultiSelectController?.add(element);
        }
      }

      notifyListeners();
    }
  }

  final MultiSelectController<String>? reminderMultiSelectController =
      MultiSelectController<String>([]);
  final MultiSelectController<String>? habitCategoryMultiSelectController =
      MultiSelectController<String>([]);

  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController nameController = TextEditingController();
  final NotificationService _notificationService = NotificationService();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeField = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final UserService _userService = locator<UserService>();
  final HabitRepository habitRepository = HabitRepository();

  String? _errorText;
  String? get errorText => _errorText;

  void clearError() {
    _errorText = null;
    notifyListeners();
  }

  // Color
  int _selectedColorIndex = 0;
  int get selectedColorIndex => _selectedColorIndex;
  Color get selectedColor => AppColors.getHabitColorList[selectedColorIndex];

  void setSelectedColorIndex({required int colorIndex}) {
    _selectedColorIndex = colorIndex;
    notifyListeners();
  }

  // Icon
  String _selectedIconName = AppIconPack.iconPack.first;
  String get selectedIconName => _selectedIconName;

  void setSelectedIconName({required String iconName}) {
    _selectedIconName = iconName;
    notifyListeners();
  }

  // Interval Type
  String? _intervalType = "Day";
  String? get intervalType => _intervalType;

  void setIntervalType(String? value) {
    _intervalType = value;
    notifyListeners();
  }

// Reminder Days
  List<String>? _reminderDays;
  List<String>? get reminderDays => _reminderDays;

  void setReminderDays(List<String>? value) {
    _reminderDays = value;
    notifyListeners();
  }

// Completion Goal
  int completionGoal = 1;
  int get completionGoalValue => completionGoal;

  set completionGoalValue(int value) {
    completionGoal = value;
    notifyListeners();
  }

// Habit Category
  List<String>? _habitCategory;
  List<String>? get habitCategory => _habitCategory;

  void setHabitCategory(List<String>? value) {
    _habitCategory = value;
    notifyListeners();
  }

  // Form Validation
  bool isFormErrorFree() {
    bool isValid = true;
    _errorText = null;

    if (nameController.text.isEmpty) {
      _errorText = "Name cannot be empty";
      isValid = false;
    }

    if (descriptionController.text.isEmpty) {
      _errorText = "Description cannot be empty";
      isValid = false;
    }

    if (!isValid) {
      notifyListeners();
    }

    return isValid;
  }

  // New method to get habit limits based on user plan
  int getHabitLimit() {
    final bool isPremiumUser = _userService.getUser()?.premiumUser ?? false;
    return Plans.getHabitLimit(isPremiumUser ? Plans.premium : Plans.free);
  }

  void createHabit() async {
    if (!isFormErrorFree()) {
      // Move to the top of the screen
      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      return;
    }

    // Enforce habit limit based on plan
    final int habitCount = await habitRepository.countHabits(
      userId: _userService.getUser()?.userId ?? "userId",
    );
    final int habitLimit = getHabitLimit();

    if (habitCount >= habitLimit) {
      _errorText = "You have reached your habit limit for the current plan.";
      notifyListeners();
      return;
    }

    // Proceed to create the habit
    Color selectedColor = AppColors.getHabitColorList[selectedColorIndex];
    String colorName = AppColors.colorNameMap[selectedColor] ?? "creamColor";

    var uuid = Uuid();
    final newHabit = Habit(
      habitId: uuid.v4(),
      userId: _userService.getUser()?.userId ?? "userId",
      habitName: nameController.text,
      habitDescription: descriptionController.text,
      completionsGoal: completionGoal,
      categories: _habitCategory,
      icon: selectedIconName,
      heatMapColor: colorName,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      intervalType: intervalType,
      completionsPerInterval: completionGoal,
      reminderDays: reminderDays,
      reminderTime: selectedTime,
    );
    try {
      habitRepository.createHabit(
        habit: newHabit,
      );
      _notificationService.scheduleHabitReminders(newHabit);
    } catch (e) {
      log("Error: $e");
    }

    _navigationService.back();
  }

  void updateHabit() async {
    if (!isFormErrorFree()) {
      // Move to the top of the screen
      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      return;
    }

    if (oldHabit != null) {
      Color selectedColor = AppColors.getHabitColorList[selectedColorIndex];

      String colorName = AppColors.colorNameMap[selectedColor] ?? "creamColor";
      final Habit updatedHabit = oldHabit!.copyWith(
        habitName: nameController.text,
        habitDescription: descriptionController.text,
        completionsGoal: completionGoal,
        intervalType: intervalType,
        categories: _habitCategory,
        icon: selectedIconName,
        heatMapColor: colorName,
        reminderDays: _reminderDays,
        reminderTime: selectedTime,
        updatedAt: DateTime.now(),
      );

      try {

        await habitRepository.updateHabit(habit: updatedHabit);
        _notificationService.scheduleHabitReminders(updatedHabit);
        _navigationService.back();
      } catch (e) {
        log("Error updating habit: $e");
      }
    }
  }

  // Time Picker
  DateTime selectedTime = DateTime(2021, 1, 1, 12, 0);
  String timeLabel = "12:00 PM";

  void selectTime({required BuildContext context}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: selectedTime.hour, minute: selectedTime.minute),
    );

    // ignore: use_build_context_synchronously
    updateTimeUI(picked: picked, context: context);
  }

  void updateTimeUI({TimeOfDay? picked, required BuildContext context}) {
    if (picked != null) {
      selectedTime = DateTime(2021, 1, 1, picked.hour, picked.minute);
      timeField.text = picked.format(context);
      timeLabel = "Time";
      notifyListeners();
    }
  }

  String formatTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

  void goBack() {
    _navigationService.back();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    timeField.dispose();
    scrollController.dispose();
    reminderMultiSelectController?.dispose();
    habitCategoryMultiSelectController?.dispose();
    super.dispose();
  }
}
