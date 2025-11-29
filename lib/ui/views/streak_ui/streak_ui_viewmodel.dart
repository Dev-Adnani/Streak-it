import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/local/plans.dart';
import 'package:streakit/repository/habit_completion_repository.dart';
import 'package:streakit/repository/habit_repository.dart';
import 'package:streakit/services/notification_service.dart';
import 'package:streakit/services/user_service.dart';

class StreakUiViewModel extends BaseViewModel {
  final HabitCompletionRepository _habitCompletionRepository =
      HabitCompletionRepository();
  final HabitRepository _habitRepository = HabitRepository();
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String? _errorText;
  String? get errorText => _errorText;

  void clearError() {
    _errorText = null;
    notifyListeners();
  }

  /// Updates the habit completion, enforcing limits based on user plan
  Future<void> updateCompletion(
      String habitId, DateTime completion, int interval) async {
    final String userId = _userService.getUser()?.userId ?? "userId";

    // Add the new completion
    _habitCompletionRepository.addCompletion(
      habitId: habitId,
      userId: userId,
      completionTime: completion,
      completionsPerInterval: interval,
    );
  }

  /// Returns the number of completions for the current day
  Future<bool> currentHabitCompletions({required String habitId}) async {
    final String userId = _userService.getUser()?.userId ?? "userId";

    // Fetch current completions for the habit today
    final int currentCompletions =
        await _habitCompletionRepository.countCompletionsForHabit(
      habitId: habitId,
      userId: userId,
      date: DateTime.now(),
    );

    // Check user plan type
    final bool isPremiumUser = _userService.getUser()?.premiumUser ?? false;
    final int completionLimit = Plans.getCompletionLimit(
      isPremiumUser ? Plans.premium : Plans.free,
    );

    if (currentCompletions >= completionLimit) {
      _errorText = "You have reached your completion limit for today";
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  /// Archives a habit
  Future<String> archiveHabit({Habit? habit}) async {
    String data = await _habitRepository.changeHabitArchivedStatus(
        habitId: habit?.habitId ?? " ");
    NotificationService notificationService = locator<NotificationService>();

    if (habit != null) {
      notificationService.cancelHabitReminders(habit);
    }

    return data;
  }

  /// Navigates to edit habit view
  void editHabit({Habit? habit}) {
    _navigationService.navigateToCreateHabitView(habit: habit);
  }
}
