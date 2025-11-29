// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<PremiumPlan> _$PremiumPlanFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PremiumPlan(
      planId: data['plan_id'] as String?,
      userId: data['user_id'] as String,
      planType: data['plan_type'] as String,
      startDate: DateTime.parse(data['start_date'] as String),
      endDate: data['end_date'] == null
          ? null
          : DateTime.tryParse(data['end_date'] as String),
      price: data['price'] as double,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String));
}

Future<Map<String, dynamic>> _$PremiumPlanToSupabase(PremiumPlan instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'plan_id': instance.planId,
    'user_id': instance.userId,
    'plan_type': instance.planType,
    'start_date': instance.startDate.toIso8601String(),
    'end_date': instance.endDate?.toIso8601String(),
    'price': instance.price,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

Future<PremiumPlan> _$PremiumPlanFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return PremiumPlan(
      planId: data['plan_id'] as String,
      userId: data['user_id'] as String,
      planType: data['plan_type'] as String,
      startDate: DateTime.parse(data['start_date'] as String),
      endDate: data['end_date'] == null
          ? null
          : data['end_date'] == null
              ? null
              : DateTime.tryParse(data['end_date'] as String),
      price: data['price'] as double,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$PremiumPlanToSqlite(PremiumPlan instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'plan_id': instance.planId,
    'user_id': instance.userId,
    'plan_type': instance.planType,
    'start_date': instance.startDate.toIso8601String(),
    'end_date': instance.endDate?.toIso8601String(),
    'price': instance.price,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

/// Construct a [PremiumPlan]
class PremiumPlanAdapter extends OfflineFirstWithSupabaseAdapter<PremiumPlan> {
  PremiumPlanAdapter();

  @override
  final supabaseTableName = 'plans';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'planId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'plan_id',
    ),
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
      foreignKey: 'user_id',
    ),
    'planType': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'plan_type',
    ),
    'startDate': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'start_date',
    ),
    'endDate': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'end_date',
    ),
    'price': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'price',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'planId'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'planId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'plan_id',
      iterable: false,
      type: String,
    ),
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    ),
    'planType': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'plan_type',
      iterable: false,
      type: String,
    ),
    'startDate': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'start_date',
      iterable: false,
      type: DateTime,
    ),
    'endDate': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'end_date',
      iterable: false,
      type: DateTime,
    ),
    'price': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'price',
      iterable: false,
      type: double,
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
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      PremiumPlan instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `PremiumPlan` WHERE plan_id = ? LIMIT 1''',
        [instance.planId]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'PremiumPlan';

  @override
  Future<PremiumPlan> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PremiumPlanFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(PremiumPlan input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PremiumPlanToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<PremiumPlan> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PremiumPlanFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(PremiumPlan input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$PremiumPlanToSqlite(input,
          provider: provider, repository: repository);
}
