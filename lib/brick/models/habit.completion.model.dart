import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'habit_completions'),
)
class HabitCompletion extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true, name: 'habit_completion_id')
  @Supabase(unique: true)
  final String? habitCompletionId;

  @Supabase(foreignKey: 'habit_id')
  final String habitId;

  @Supabase(foreignKey: 'user_id')
  final String userId;

  // Store JSON as text in the database
  @Sqlite(name: 'per_day_completed_datetime')
  final List<String> perDayCompletedDatetime;

  @Sqlite(name: 'updated_at')
  final DateTime? updatedAt;

  @Sqlite(name: 'created_at')
  final DateTime? createdAt;

  // Updated constructor to accept a JSON string directly for perDayCompletedDatetime
  HabitCompletion({
    String? habitCompletionId,
    required this.habitId,
    required this.userId,
    required this.perDayCompletedDatetime, // Accept JSON string directly
    this.updatedAt,
    this.createdAt,
  }) : habitCompletionId = habitCompletionId ?? const Uuid().v4();

  // CopyWith method for updating the perDayCompletedDatetime & updatedAt
  HabitCompletion copyWith({
    String? habitCompletionId,
    String? habitId,
    String? userId,
    List<String>? perDayCompletedDatetime,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return HabitCompletion(
      habitCompletionId: habitCompletionId ?? this.habitCompletionId,
      habitId: habitId ?? this.habitId,
      userId: userId ?? this.userId,
      perDayCompletedDatetime:
          perDayCompletedDatetime ?? this.perDayCompletedDatetime,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
