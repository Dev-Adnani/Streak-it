// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Habit> _$HabitFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Habit(
      habitId: data['habit_id'] as String?,
      userId: data['user_id'] as String?,
      habitName: data['habit_name'] as String?,
      habitDescription: data['habit_description'] as String?,
      completionsGoal: data['completions_goal'] as int?,
      categories: data['categories']?.toList().cast<String>(),
      icon: data['icon'] as String?,
      heatMapColor: data['heat_map_color'] as String?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.tryParse(data['updated_at'] as String),
      reminderDays: data['reminder_days']?.toList().cast<String>(),
      reminderTime: data['reminder_time'] == null
          ? null
          : DateTime.tryParse(data['reminder_time'] as String),
      intervalType: data['interval_type'] as String?,
      completionsPerInterval: data['completions_per_interval'] as int?,
      isArchived: data['is_archived'] as bool?);
}

Future<Map<String, dynamic>> _$HabitToSupabase(Habit instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'habit_id': instance.habitId,
    'user_id': instance.userId,
    'habit_name': instance.habitName,
    'habit_description': instance.habitDescription,
    'completions_goal': instance.completionsGoal,
    'categories': instance.categories,
    'icon': instance.icon,
    'heat_map_color': instance.heatMapColor,
    'created_at': instance.createdAt?.toIso8601String(),
    'updated_at': instance.updatedAt?.toIso8601String(),
    'reminder_days': instance.reminderDays,
    'reminder_time': instance.reminderTime?.toIso8601String(),
    'interval_type': instance.intervalType,
    'completions_per_interval': instance.completionsPerInterval,
    'is_archived': instance.isArchived
  };
}

Future<Habit> _$HabitFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Habit(
      habitId: data['habit_id'] as String,
      userId: data['user_id'] == null ? null : data['user_id'] as String?,
      habitName:
          data['habit_name'] == null ? null : data['habit_name'] as String?,
      habitDescription: data['habit_description'] == null
          ? null
          : data['habit_description'] as String?,
      completionsGoal: data['completions_goal'] == null
          ? null
          : data['completions_goal'] as int?,
      categories: data['categories'] == null
          ? null
          : jsonDecode(data['categories']).toList().cast<String>(),
      icon: data['icon'] == null ? null : data['icon'] as String?,
      heatMapColor: data['heat_map_color'] == null
          ? null
          : data['heat_map_color'] as String?,
      createdAt: data['created_at'] == null
          ? null
          : data['created_at'] == null
              ? null
              : DateTime.tryParse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : data['updated_at'] == null
              ? null
              : DateTime.tryParse(data['updated_at'] as String),
      reminderDays: data['reminder_days'] == null
          ? null
          : jsonDecode(data['reminder_days']).toList().cast<String>(),
      reminderTime: data['reminder_time'] == null
          ? null
          : data['reminder_time'] == null
              ? null
              : DateTime.tryParse(data['reminder_time'] as String),
      intervalType: data['interval_type'] == null
          ? null
          : data['interval_type'] as String?,
      completionsPerInterval: data['completions_per_interval'] == null
          ? null
          : data['completions_per_interval'] as int?,
      isArchived: data['is_archived'] == null ? null : data['is_archived'] == 1)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$HabitToSqlite(Habit instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'habit_id': instance.habitId,
    'user_id': instance.userId,
    'habit_name': instance.habitName,
    'habit_description': instance.habitDescription,
    'completions_goal': instance.completionsGoal,
    'categories':
        instance.categories == null ? null : jsonEncode(instance.categories),
    'icon': instance.icon,
    'heat_map_color': instance.heatMapColor,
    'created_at': instance.createdAt?.toIso8601String(),
    'updated_at': instance.updatedAt?.toIso8601String(),
    'reminder_days': instance.reminderDays == null
        ? null
        : jsonEncode(instance.reminderDays),
    'reminder_time': instance.reminderTime?.toIso8601String(),
    'interval_type': instance.intervalType,
    'completions_per_interval': instance.completionsPerInterval,
    'is_archived':
        instance.isArchived == null ? null : (instance.isArchived! ? 1 : 0)
  };
}

/// Construct a [Habit]
class HabitAdapter extends OfflineFirstWithSupabaseAdapter<Habit> {
  HabitAdapter();

  @override
  final supabaseTableName = 'habits';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'habitId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'habit_id',
    ),
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
    ),
    'habitName': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'habit_name',
    ),
    'habitDescription': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'habit_description',
    ),
    'completionsGoal': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'completions_goal',
    ),
    'categories': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'categories',
    ),
    'icon': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'icon',
    ),
    'heatMapColor': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'heat_map_color',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
    ),
    'reminderDays': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'reminder_days',
    ),
    'reminderTime': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'reminder_time',
    ),
    'intervalType': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'interval_type',
    ),
    'completionsPerInterval': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'completions_per_interval',
    ),
    'isArchived': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'is_archived',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'habitId'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'habitId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'habit_id',
      iterable: false,
      type: String,
    ),
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    ),
    'habitName': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'habit_name',
      iterable: false,
      type: String,
    ),
    'habitDescription': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'habit_description',
      iterable: false,
      type: String,
    ),
    'completionsGoal': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'completions_goal',
      iterable: false,
      type: int,
    ),
    'categories': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'categories',
      iterable: true,
      type: String,
    ),
    'icon': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'icon',
      iterable: false,
      type: String,
    ),
    'heatMapColor': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'heat_map_color',
      iterable: false,
      type: String,
    ),
    'createdAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'created_at',
      iterable: false,
      type: DateTime,
    ),
    'updatedAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'updated_at',
      iterable: false,
      type: DateTime,
    ),
    'reminderDays': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'reminder_days',
      iterable: true,
      type: String,
    ),
    'reminderTime': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'reminder_time',
      iterable: false,
      type: DateTime,
    ),
    'intervalType': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'interval_type',
      iterable: false,
      type: String,
    ),
    'completionsPerInterval': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'completions_per_interval',
      iterable: false,
      type: int,
    ),
    'isArchived': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'is_archived',
      iterable: false,
      type: bool,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      Habit instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `Habit` WHERE habit_id = ? LIMIT 1''',
        [instance.habitId]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Habit';

  @override
  Future<Habit> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(Habit input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Habit> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(Habit input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitToSqlite(input, provider: provider, repository: repository);
}
