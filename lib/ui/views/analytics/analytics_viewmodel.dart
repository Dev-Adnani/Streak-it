import 'package:stacked/stacked.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/brick/models/habit.completion.model.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/repository/habit_completion_repository.dart';
import 'package:streakit/repository/habit_repository.dart';
import 'package:streakit/services/user_service.dart';
import 'package:streakit/ui/utils/habit_analytics.dart';

const String _habitsStreamKey = 'habitsStream';
const String _completionsStreamKey = 'completionsStream';

class AnalyticsViewModel extends MultipleStreamViewModel {
  final HabitRepository _habitRepository = HabitRepository();
  final HabitCompletionRepository _habitCompletionRepository =
      HabitCompletionRepository();
  final UserService _userService = locator<UserService>();

  Habit? selectedHabit;

  @override
  Map<String, StreamData> get streamsMap => {
        _habitsStreamKey: StreamData<List<Habit>>(
          _habitRepository.getHabitsByUserIdNotArchived(
            userId: _userService.getUser()?.userId ?? "userId",
          ),
        ),
        _completionsStreamKey: StreamData<List<HabitCompletion>>(
          _habitCompletionRepository.getHabitCompletionsByUserId(
            userId: _userService.getUser()?.userId ?? "userId",
          ),
        ),
      };

  /// Get habits stream
  List<Habit> get habits {
    final fetchedHabits = dataMap?[_habitsStreamKey] as List<Habit>? ?? [];
    if (fetchedHabits.isNotEmpty) {
      if (selectedHabit == null || !fetchedHabits.contains(selectedHabit)) {
        // Use Future to avoid rebuilding during the build phase
        Future.microtask(() {
          selectedHabit = fetchedHabits.first;
          notifyListeners();
        });
      }
    }
    return fetchedHabits;
  }

  /// Get completions stream for selected habit
  List<HabitCompletion> get completions {
    final allCompletions =
        dataMap?[_completionsStreamKey] as List<HabitCompletion>? ?? [];
    if (selectedHabit == null) return [];
    return allCompletions
        .where((completion) => completion.habitId == selectedHabit?.habitId)
        .toList();
  }

  /// Set selected habit and notify listeners
  void onSelectHabit(Habit habit) {
    selectedHabit = habit;
    notifyListeners();
  }

  /// Calculate metrics for the selected habit
  HabitMetrics? get habitMetrics {
    if (completions.isEmpty) return null;
    final analytics = HabitAnalytics(completions);
    return analytics.calculateMetrics();
  }

  /// Prepare monthly completions for the selected habit
  List<MonthlyCompletion> get monthlyCompletions {
    if (completions.isEmpty) return [];
    final analytics = HabitAnalytics(completions);
    return analytics.getMonthlyCompletions();
  }

  /// Prepare weekly completions for the selected habit
  List<WeeklyCompletion> get weeklyCompletions {
    if (completions.isEmpty) return [];
    final analytics = HabitAnalytics(completions);
    return analytics.getWeeklyCompletions();
  }

  /// Check if data is sufficient for analytics
  bool get hasSufficientData => completions.length >= 7;

  bool get isLoading => busy(_habitsStreamKey) || busy(_completionsStreamKey);

  @override
  bool get hasError =>
      hasErrorForKey(_habitsStreamKey) || hasErrorForKey(_completionsStreamKey);
}
