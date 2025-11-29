import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'habits'),
)
class Habit extends OfflineFirstWithSupabaseModel {
  @Sqlite(name: 'habit_id', index: true, unique: true)
  @Supabase(unique: true)
  final String habitId;

  @Sqlite(name: 'user_id', index: true)
  final String? userId;

  @Sqlite(name: 'habit_name')
  final String? habitName;

  @Sqlite(name: 'habit_description')
  final String? habitDescription;

  @Sqlite(name: 'completions_goal')
  final int? completionsGoal;

  @Sqlite(name: 'categories')
  final List<String>? categories;

  @Sqlite(name: 'icon')
  final String? icon;

  @Sqlite(name: 'heat_map_color')
  final String? heatMapColor;

  @Sqlite(name: 'created_at')
  final DateTime? createdAt;

  @Sqlite(name: 'updated_at')
  final DateTime? updatedAt;

  // Reminder fields

  @Sqlite(name: 'reminder_days')
  final List<String>? reminderDays;

  @Sqlite(name: 'reminder_time')
  final DateTime? reminderTime;

  // Streak fields

  @Sqlite(name: 'interval_type')
  final String? intervalType;

  @Sqlite(name: 'completions_per_interval')
  final int? completionsPerInterval;

  @Sqlite(name: 'is_archived')
  final bool? isArchived;

  Habit({
    String? habitId,
    this.userId,
    this.habitName,
    this.habitDescription,
    this.completionsGoal,
    this.categories,
    this.heatMapColor,
    this.createdAt,
    this.icon,
    this.updatedAt,
    this.reminderDays,
    this.reminderTime,
    this.intervalType,
    this.completionsPerInterval,
    bool? isArchived,
  })  : habitId = habitId ?? Uuid().v4(),
        isArchived = isArchived ?? false;

  Habit copyWith({
    String? habitId,
    String? userId,
    String? habitName,
    String? habitDescription,
    int? completionsGoal,
    List<String>? categories,
    String? icon,
    String? heatMapColor,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? reminderDays,
    DateTime? reminderTime,
    String? intervalType,
    int? completionsPerInterval,
    bool? isArchived,
  }) {
    return Habit(
      habitId: habitId ?? this.habitId,
      userId: userId ?? this.userId,
      habitName: habitName ?? this.habitName,
      habitDescription: habitDescription ?? this.habitDescription,
      completionsGoal: completionsGoal ?? this.completionsGoal,
      categories: categories ?? this.categories,
      icon: icon ?? this.icon,
      heatMapColor: heatMapColor ?? this.heatMapColor,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      reminderDays: reminderDays ?? this.reminderDays,
      reminderTime: reminderTime ?? this.reminderTime,
      intervalType: intervalType ?? this.intervalType,
      completionsPerInterval:
          completionsPerInterval ?? this.completionsPerInterval,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}
