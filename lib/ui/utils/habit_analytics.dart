import 'package:intl/intl.dart';
import 'package:streakit/brick/models/habit.completion.model.dart';

class HabitMetrics {
  final int streakDays;
  final int totalCompletions;
  final int currentStreak;
  final int bestStreak;
  final String? bestMonth;

  HabitMetrics({
    required this.streakDays,
    required this.totalCompletions,
    required this.currentStreak,
    required this.bestStreak,
    required this.bestMonth,
  });
}

class MonthlyCompletion {
  final String month;
  final int completions;

  MonthlyCompletion({
    required this.month,
    required this.completions,
  });
}

class WeeklyCompletion {
  final String day;
  final int completions;

  WeeklyCompletion({
    required this.day,
    required this.completions,
  });
}

class HabitAnalytics {
  final List<HabitCompletion> habitCompletions;

  HabitAnalytics(this.habitCompletions);

  /// Calculate habit metrics (Streak, Total Completions, Current Streak, Best Streak)
  HabitMetrics calculateMetrics() {
    habitCompletions.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    final completionDates = habitCompletions
        .expand((completion) => completion.perDayCompletedDatetime
            .map((date) => DateTime.parse(date)))
        .toList()
      ..sort();

    int totalCompletions = completionDates.length;
    int currentStreak = 0;
    int bestStreak = 0;
    int streak = 0;

    DateTime? previousDate;

    for (var date in completionDates) {
      if (previousDate != null && date.difference(previousDate).inDays == 1) {
        streak++;
      } else if (previousDate != null &&
          date.difference(previousDate).inDays > 1) {
        bestStreak = streak > bestStreak ? streak : bestStreak;
        streak = 1; // Reset streak
      } else {
        streak = 1; // First day in streak
      }
      previousDate = date;
    }
    // Update bestStreak and currentStreak
    bestStreak = streak > bestStreak ? streak : bestStreak;
    currentStreak = streak;
    String? bestMonth = getBestMonth();

    return HabitMetrics(
      streakDays: completionDates.length,
      totalCompletions: totalCompletions,
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      bestMonth: bestMonth,
    );
  }

  /// Prepare data for Monthly Completion Bar Graph
  List<MonthlyCompletion> getMonthlyCompletions() {
    final monthlyData = <String, int>{};
    final formatter = DateFormat('MMM yy'); // Use "Dec 24" format

    for (var completion in habitCompletions) {
      for (var dateStr in completion.perDayCompletedDatetime) {
        final date = DateTime.parse(dateStr);
        final monthKey = formatter.format(date);

        monthlyData[monthKey] = (monthlyData[monthKey] ?? 0) + 1;
      }
    }

    return monthlyData.entries
        .map((entry) =>
            MonthlyCompletion(month: entry.key, completions: entry.value))
        .toList();
  }

  /// Get the best month (month with the highest completions)
  String? getBestMonth() {
    final monthlyCompletions = getMonthlyCompletions();
    if (monthlyCompletions.isEmpty) return null;

    final bestMonth = monthlyCompletions.reduce(
        (a, b) => a.completions > b.completions ? a : b); // Find the best month
    return bestMonth.month;
  }

  /// Prepare data for Weekly Trend Graph
  List<WeeklyCompletion> getWeeklyCompletions() {
    final weeklyData = <String, int>{
      "Monday": 0,
      "Tuesday": 0,
      "Wednesday": 0,
      "Thursday": 0,
      "Friday": 0,
      "Saturday": 0,
      "Sunday": 0,
    };

    for (var completion in habitCompletions) {
      for (var dateStr in completion.perDayCompletedDatetime) {
        final date = DateTime.parse(dateStr);
        final dayOfWeek = DateFormat('EEEE').format(date);

        weeklyData[dayOfWeek] = (weeklyData[dayOfWeek] ?? 0) + 1;
      }
    }

    return weeklyData.entries
        .map((entry) =>
            WeeklyCompletion(day: entry.key, completions: entry.value))
        .toList();
  }
}
