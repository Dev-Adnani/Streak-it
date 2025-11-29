import 'package:streakit/brick/models/habit.completion.model.dart';
import 'package:streakit/brick/models/habit.model.dart';

class FullHabit {
  final Habit habit;
  final List<HabitCompletion> habitCompletions;

  FullHabit({
    required this.habit,
    required this.habitCompletions,
  });
}
