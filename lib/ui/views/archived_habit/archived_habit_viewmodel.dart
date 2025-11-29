import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/repository/habit_completion_repository.dart';
import 'package:streakit/repository/habit_repository.dart';
import 'package:streakit/services/notification_service.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/ui/views/archived_habit/widget/delete_habit_warning.dart';

class ArchivedHabitViewModel extends StreamViewModel<List<Habit>> {
  final NavigationService _navigationService = locator<NavigationService>();
  final HabitRepository _habitRepository = HabitRepository();
  final HabitCompletionRepository _habitCompletionRepository =
      HabitCompletionRepository();
  final UserService _userService = locator<UserService>();

  @override
  Stream<List<Habit>> get stream => _habitRepository.getHabitsByUserIdArchived(
      userId: _userService.getUser()?.userId ?? "userId");

  void goBack() {
    _navigationService.back();
  }

  Future<String> changeHabitStatus({Habit? habit}) async {
    String result =
        await _habitRepository.changeHabitArchivedStatus(habitId: habit?.habitId ?? "");
    if(habit != null) {
      NotificationService notificationService = locator<NotificationService>();
      notificationService.scheduleHabitReminders(habit);
    }
    return result;
  }

  void deleteHabit({required Habit habit}) {
    final String userId = _userService.getUser()?.userId ?? "userId";
    _habitCompletionRepository.deleteHabitCompletion(
        habitId: habit.habitId, userId: userId);
    _habitRepository.deleteHabit(
      habit: habit,
    );
  }

  void showDeleteAccountDialog(
      {required BuildContext context, required Habit habit}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteHabitDialog(
          onConfirm: () {
            deleteHabit(habit: habit);
            Navigator.of(context).pop(); // Close dialog
          },
          onCancel: () {
            Navigator.of(context).pop(); // Close dialog
          },
        );
      },
    );
  }
}
