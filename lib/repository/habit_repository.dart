import 'dart:developer';

import 'package:brick_core/query.dart';
import 'package:streakit/brick/models/habit.model.dart';
import 'package:streakit/brick/repository.dart';

abstract class HabitAbstractRepository {
  Future<Habit?> getHabit({required String habitId});
  Future<void> createHabit({
    required Habit habit,
  });
  Future<void> updateHabit({
    required Habit habit,
  });
  Future<void> deleteHabit({required Habit habit});

  Future<String> changeHabitArchivedStatus({required String habitId});

  Future<List<Habit>> getFHabitsByUserIdNotArchived({required String userId});

  Future<int> countHabits({required String userId});
  Stream<List<Habit>> getHabitsByUserIdNotArchived({required String userId});
  Stream<List<Habit>> getHabitsByUserIdArchived({required String userId});
}

class HabitRepository implements HabitAbstractRepository {
  final Repository _repository = Repository();

  @override
  Future<String> changeHabitArchivedStatus({required String habitId}) async {
    try {
      Habit? habit = await getHabit(habitId: habitId);
      if (habit != null) {
        final bool changeStatus = habit.isArchived ?? false;
        Habit updatedHabit = habit.copyWith(isArchived: !changeStatus);
        await _repository.upsert<Habit>(updatedHabit);

        // Current Archived status
        return "Habit archived status changed to: ${!changeStatus}";
      }
    } catch (e) {
      throw Exception("Error changing habit archived status: $e");
    }
    return "error";
  }

  @override
  Future<Habit?> getHabit({required String habitId}) async {
    try {
      final habits = await _repository.get<Habit>(
        query: Query.where('habitId', habitId),
      );
      return habits.isNotEmpty ? habits.first : null;
    } catch (e) {
      throw Exception("Error fetching habit: $e");
    }
  }

  @override
  Future<void> createHabit({
    required Habit habit,
  }) async {
    try {
      // Create habit
      await _repository.upsert<Habit>(habit);
    } catch (e) {
      throw Exception("Error creating habit: $e");
    }
  }

  @override
  Future<void> updateHabit({
    required Habit habit,
  }) async {
    try {
      // Update habit
      await _repository.upsert<Habit>(
        habit,
        query: Query(
          action: QueryAction.update,
          where: [
            Where.exact(
              'habitId',
              habit.habitId,
            ),
          ],
        ),
      );
    } catch (e) {
      throw Exception("Error updating habit: $e");
    }
  }

  @override
  Future<void> deleteHabit({required Habit habit}) async {
    try {
      bool delete = await _repository.delete<Habit>(
        habit,
        query: Query(
          action: QueryAction.delete,
          where: [
            Where.exact(
              'habitId',
              habit.habitId,
            ),
            Where.exact(
              'userId',
              habit.userId,
            )
          ],
        ),
      );

      if (delete) {
        log("Habit deleted successfully. ID: ${habit.habitId}");
      }
    } catch (e) {
      throw Exception("Error deleting habit: $e");
    }
  }

  @override
  Stream<List<Habit>> getHabitsByUserIdNotArchived({required String userId}) {
    // Stream for Habits by userId
    final habitsStream = _repository.subscribe<Habit>(
      query: Query(
        where: [
          Where('userId').isExactly(userId),
          Where('isArchived').isExactly(false),
        ],
      ),
    );
    return habitsStream;
  }

  @override
  Future<List<Habit>> getFHabitsByUserIdNotArchived(
      {required String userId}) async {
    try {
      final habits = await _repository.get<Habit>(
        query: Query(
          where: [
            Where('userId').isExactly(userId),
            Where('isArchived').isExactly(false),
          ],
        ),
      );
      return habits;
    } catch (e) {
      throw Exception("Error fetching habits: $e");
    }
  }

  @override
  Future<int> countHabits({required String userId}) async {
    try {
      final List<Habit> habits = await _repository.get<Habit>(
        query: Query(
          where: [
            Where('userId').isExactly(userId),
            Where('isArchived').isExactly(false),
          ],
        ),
      );
      return habits.length; // Return the count of habits
    } catch (e) {
      throw Exception("Error counting habits: $e");
    }
  }

  @override
  Stream<List<Habit>> getHabitsByUserIdArchived({required String userId}) {
    // Stream for Habits by userId
    final habitsStream = _repository.subscribe<Habit>(
      query: Query(
        where: [
          Where('userId').isExactly(userId),
          Where('isArchived').isExactly(true),
        ],
      ),
    );

    return habitsStream;
  }
}
