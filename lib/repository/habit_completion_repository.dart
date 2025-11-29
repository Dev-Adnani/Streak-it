import 'dart:developer';

import 'package:brick_core/query.dart';
import 'package:streakit/brick/models/habit.completion.model.dart';
import 'package:streakit/brick/repository.dart';

abstract class HabitCompletionAbstractRepository {
  Future<HabitCompletion?> getHabitCompletionForDay({
    required String habitId,
    required DateTime date,
  });

  Future<void> addCompletion({
    required String habitId,
    required String userId,
    required DateTime completionTime,
    required int completionsPerInterval,
  });

  Future<int> countCompletionsForHabit({
    required String habitId,
    required String userId,
    required DateTime date,
  });

  Stream<List<HabitCompletion>> getHabitCompletionsByUserId({
    required String userId,
  });

  Future<List<HabitCompletion>> getFHabitCompletionsByUserId({
    required String habitId,
  });

  // delete habit completion of a particular habit - all completions
  Future<void> deleteHabitCompletion(
      {required String habitId, required String userId});
}

class HabitCompletionRepository implements HabitCompletionAbstractRepository {
  final Repository _repository = Repository();

  @override
  Future<HabitCompletion?> getHabitCompletionForDay({
    required String habitId,
    required DateTime date,
  }) async {
    try {
      // Format the date as 'YYYY-MM-DD' for strict matching
      final String targetDate =
          DateTime(date.year, date.month, date.day).toIso8601String();

      final completions = await _repository.get<HabitCompletion>(
        query: Query(
          where: [
            WherePhrase(
              [
                Where('habitId', value: habitId),
                And('createdAt').isExactly(targetDate),
              ],
            ),
          ],
        ),
      );

      return completions.isNotEmpty ? completions.first : null;
    } catch (e) {
      throw Exception("Error fetching habit completion for day: $e");
    }
  }

  @override
  Future<void> addCompletion({
    required String habitId,
    required String userId,
    required DateTime completionTime,
    required int completionsPerInterval,
  }) async {
    try {
      // Format the date to strip time
      final DateTime targetDate = DateTime(
        completionTime.year,
        completionTime.month,
        completionTime.day,
      );

      // Fetch existing data for the date
      HabitCompletion? habitCompletion = await getHabitCompletionForDay(
        habitId: habitId,
        date: targetDate,
      );

      List<String>? perDayCompletedDatetime;

      if (habitCompletion == null) {
        // No entry exists, create a new list with the first completion
        perDayCompletedDatetime = [completionTime.toIso8601String()];
      } else {
        // Entry exists, use the current perDayCompletedDatetime
        perDayCompletedDatetime =
            List.from(habitCompletion.perDayCompletedDatetime);

        // Add the new completion time to the list
        perDayCompletedDatetime.add(completionTime.toIso8601String());

        // Check if the interval is complete
        if (perDayCompletedDatetime.length > completionsPerInterval) {
          perDayCompletedDatetime = null; // Reset when interval is met
        }
      }

      // Create or update the habit completion entry
      final updatedCompletion = HabitCompletion(
        habitCompletionId: habitCompletion?.habitCompletionId,
        habitId: habitId,
        userId: userId,
        perDayCompletedDatetime: perDayCompletedDatetime ?? [],
        createdAt: habitCompletion?.createdAt ?? targetDate,
        updatedAt: DateTime.now(),
      );

      // Save the changes
      await _repository.upsert<HabitCompletion>(updatedCompletion);

      log("Habit completion updated successfully.");
    } catch (e) {
      throw Exception("Error adding completion: $e");
    }
  }

  @override
  Future<int> countCompletionsForHabit({
    required String habitId,
    required String userId,
    required DateTime date,
  }) async {
    try {
      // Calculate the start and end of the day in UTC
      final DateTime startOfDay =
          DateTime.utc(date.year, date.month, date.day, 0, 0, 0);
      final DateTime endOfDay =
          DateTime.utc(date.year, date.month, date.day, 23, 59, 59, 999);

      // Convert to ISO 8601 format for compatibility
      final String startDate = startOfDay.toIso8601String();
      final String endDate = endOfDay.toIso8601String();


      // Query completions for the habit within the date range
      final completions = await _repository.get<HabitCompletion>(
        query: Query(
          where: [
            Where('habitId').isExactly(habitId),
            Where('userId').isExactly(userId),
            Where('updatedAt')
                .isGreaterThanOrEqualTo(startDate), // Start of the day
            Where('updatedAt')
                .isLessThan(endDate), // End of the day (exclusive)
          ],
        ),
      );

      return completions.length; // Return the count of completions
    } catch (e) {
      throw Exception("Error counting completions for habit: $e");
    }
  }

  @override
  Stream<List<HabitCompletion>> getHabitCompletionsByUserId({
    required String userId,
  }) {
    return _repository.subscribe<HabitCompletion>(
      query: Query(
        where: [
          And('userId').isExactly(userId),
        ],
      ),
    );
  }

  @override
  Future<List<HabitCompletion>> getFHabitCompletionsByUserId({
    required String habitId,
  }) {
    return _repository.get<HabitCompletion>(
      query: Query(
        where: [
          And('habitId').isExactly(habitId),
        ],
      ),
    );
  }

  @override
  Future<void> deleteHabitCompletion(
      {required String habitId, required String userId}) async {
    try {
      List<HabitCompletion> habitCompletion =
          await _repository.get<HabitCompletion>(
        query: Query(
          where: [
            And('habitId').isExactly(habitId),
            And('userId').isExactly(userId),
          ],
        ),
      );

      if (habitCompletion.isNotEmpty) {
        // loop through all completions and delete them
        for (var completion in habitCompletion) {
          bool delete = await _repository.delete<HabitCompletion>(completion);
          if (delete) {
            log("Habit completion deleted successfully. ID: ${completion.habitCompletionId}");
          }
        }
      }
    } catch (e) {
      throw Exception("Error deleting habit completion: $e");
    }
  }
}
