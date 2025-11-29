// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<HabitCompletion> _$HabitCompletionFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return HabitCompletion(
      habitCompletionId: data['habit_completion_id'] as String?,
      habitId: data['habit_id'] as String,
      userId: data['user_id'] as String,
      perDayCompletedDatetime:
          data['per_day_completed_datetime'].toList().cast<String>(),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.tryParse(data['updated_at'] as String),
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String));
}

Future<Map<String, dynamic>> _$HabitCompletionToSupabase(
    HabitCompletion instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'habit_completion_id': instance.habitCompletionId,
    'habit_id': instance.habitId,
    'user_id': instance.userId,
    'per_day_completed_datetime': instance.perDayCompletedDatetime,
    'updated_at': instance.updatedAt?.toIso8601String(),
    'created_at': instance.createdAt?.toIso8601String()
  };
}

Future<HabitCompletion> _$HabitCompletionFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return HabitCompletion(
      habitCompletionId: data['habit_completion_id'] == null
          ? null
          : data['habit_completion_id'] as String?,
      habitId: data['habit_id'] as String,
      userId: data['user_id'] as String,
      perDayCompletedDatetime: jsonDecode(data['per_day_completed_datetime'])
          .toList()
          .cast<String>(),
      updatedAt: data['updated_at'] == null
          ? null
          : data['updated_at'] == null
              ? null
              : DateTime.tryParse(data['updated_at'] as String),
      createdAt: data['created_at'] == null
          ? null
          : data['created_at'] == null
              ? null
              : DateTime.tryParse(data['created_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$HabitCompletionToSqlite(HabitCompletion instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'habit_completion_id': instance.habitCompletionId,
    'habit_id': instance.habitId,
    'user_id': instance.userId,
    'per_day_completed_datetime': jsonEncode(instance.perDayCompletedDatetime),
    'updated_at': instance.updatedAt?.toIso8601String(),
    'created_at': instance.createdAt?.toIso8601String()
  };
}

/// Construct a [HabitCompletion]
class HabitCompletionAdapter
    extends OfflineFirstWithSupabaseAdapter<HabitCompletion> {
  HabitCompletionAdapter();

  @override
  final supabaseTableName = 'habit_completions';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'habitCompletionId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'habit_completion_id',
    ),
    'habitId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'habit_id',
      foreignKey: 'habit_id',
    ),
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
      foreignKey: 'user_id',
    ),
    'perDayCompletedDatetime': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'per_day_completed_datetime',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'habitCompletionId'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'habitCompletionId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'habit_completion_id',
      iterable: false,
      type: String,
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
    'perDayCompletedDatetime': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'per_day_completed_datetime',
      iterable: true,
      type: String,
    ),
    'updatedAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'updated_at',
      iterable: false,
      type: DateTime,
    ),
    'createdAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'created_at',
      iterable: false,
      type: DateTime,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      HabitCompletion instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `HabitCompletion` WHERE habit_completion_id = ? LIMIT 1''',
        [instance.habitCompletionId]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'HabitCompletion';

  @override
  Future<HabitCompletion> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitCompletionFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(HabitCompletion input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitCompletionToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<HabitCompletion> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitCompletionFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(HabitCompletion input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$HabitCompletionToSqlite(input,
          provider: provider, repository: repository);
}
