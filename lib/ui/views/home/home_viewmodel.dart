import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:streakit/app/app.locator.dart';
import 'package:streakit/app/app.router.dart';
import 'package:streakit/brick/models/full.habit.model.dart';
import 'package:streakit/brick/models/habit.completion.model.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/local/habit_constants.dart';
import 'package:streakit/repository/habit_completion_repository.dart';
import 'package:streakit/repository/habit_repository.dart';
import 'package:streakit/services/user_service.dart';

const String _habitsStreamKey = 'habitsStream';
const String _completionsStreamKey = 'completionsStream';

class HomeViewModel extends MultipleStreamViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final HabitRepository _habitRepository = HabitRepository();
  final HabitCompletionRepository _habitCompletionRepository =
      HabitCompletionRepository();
  final UserService _userService = locator<UserService>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<HabitCategory> selectedHabitCategories = [];
  void updateSelectedCategories(List<HabitCategory> selected) {
    selectedHabitCategories = selected;
    notifyListeners();
  }

  int _tabSelectedIndexSelected = 0;
  int get tabSelectedIndexSelected => _tabSelectedIndexSelected;

  final List<String> _listEmpty = [];
  List<String> get listEmpty => _listEmpty;

  final List<IconData> _listIconTabToggle = [
    Icons.calendar_today,
    Icons.calendar_view_month,
  ];
  List<IconData> get listIconTabToggle => _listIconTabToggle;

  void changeIndex(int index) {
    _tabSelectedIndexSelected = index;
    notifyListeners();
  }

  void navigateToCreateStreak() {
    _navigationService.navigateTo(
      Routes.createHabitView,
      transition: TransitionsBuilders.slideBottom,
    );
  }

  Map<DateTime, int> datasetsFromCompletions(
      List<HabitCompletion> completions) {
    final Map<DateTime, int> datasets = {};

    for (var completion in completions) {
      for (var dateTimeString in completion.perDayCompletedDatetime) {
        final date = DateTime.parse(dateTimeString);
        final dateOnly = DateTime(date.year, date.month, date.day);
        datasets[dateOnly] = (datasets[dateOnly] ?? 0) + 1;
      }
    }
    return datasets;
  }

  @override
  Map<String, StreamData> get streamsMap {
    setLoading(true);
    // Set up loading and error handling manually
    _habitRepository
        .getHabitsByUserIdNotArchived(
      userId: _userService.getUser()?.userId ?? "userId",
    )
        .listen(
      (_) {
        // No-op: handled by streams
      },
      onDone: () => setLoading(false),
      onError: (_) => setLoading(false),
    );

    _habitCompletionRepository
        .getHabitCompletionsByUserId(
      userId: _userService.getUser()?.userId ?? "userId",
    )
        .listen(
      (_) {
        // No-op: handled by streams
      },
      onDone: () => setLoading(false),
      onError: (_) => setLoading(false),
    );

    return {
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
  }

  List<FullHabit> get fullHabits {
    final habits = dataMap?[_habitsStreamKey] as List<Habit>? ?? [];
    final completions =
        dataMap?[_completionsStreamKey] as List<HabitCompletion>? ?? [];

    final allFullHabits = habits.map((habit) {
      final habitCompletions = completions.where((completion) {
        return completion.habitId == habit.habitId;
      }).toList();

      return FullHabit(habit: habit, habitCompletions: habitCompletions);
    }).toList();

    if (selectedHabitCategories.isEmpty) {
      return allFullHabits;
    }

    return allFullHabits.where((fullHabit) {
      final habitCategories = fullHabit.habit.categories ?? [];
      return habitCategories.any((category) =>
          selectedHabitCategories.map((e) => e.name).contains(category));
    }).toList();
  }

  List<HabitCategory> get categories {
    final allHabits = dataMap?[_habitsStreamKey] as List<Habit>? ?? [];

    final allCategories = allHabits
        .map((habit) => habit.categories ?? [])
        .expand((category) => category)
        .toSet()
        .toList();

    final habitCategories = HabitConstants.habitCategories;
    return habitCategories
        .where((category) => allCategories.contains(category.name))
        .toList();
  }

  @override
  Future<void> onData(String key, dynamic data) async {
    super.onData(key, data);
    setLoading(false);
  }

  @override
  Future<void> onError(String key, error) async {
    super.onError(key, error);
    setLoading(false);
  }
}
