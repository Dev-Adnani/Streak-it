// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Users> _$UsersFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Users(
      userId: data['user_id'] as String?,
      userName: data['user_name'] as String,
      email: data['email'] as String,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String),
      profileUrl: data['profile_url'] as String,
      animalSprit: data['animal_sprit'] as String?,
      isDeleted: data['is_deleted'] as bool?,
      premiumUser: data['premium_user'] as bool?);
}

Future<Map<String, dynamic>> _$UsersToSupabase(Users instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'user_id': instance.userId,
    'user_name': instance.userName,
    'email': instance.email,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
    'profile_url': instance.profileUrl,
    'animal_sprit': instance.animalSprit,
    'is_deleted': instance.isDeleted,
    'premium_user': instance.premiumUser
  };
}

Future<Users> _$UsersFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Users(
      userId: data['user_id'] as String,
      userName: data['user_name'] as String,
      email: data['email'] as String,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String),
      profileUrl: data['profile_url'] as String,
      animalSprit:
          data['animal_sprit'] == null ? null : data['animal_sprit'] as String?,
      isDeleted: data['is_deleted'] == null ? null : data['is_deleted'] == 1,
      premiumUser:
          data['premium_user'] == null ? null : data['premium_user'] == 1)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$UsersToSqlite(Users instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'user_id': instance.userId,
    'user_name': instance.userName,
    'email': instance.email,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
    'profile_url': instance.profileUrl,
    'animal_sprit': instance.animalSprit,
    'is_deleted':
        instance.isDeleted == null ? null : (instance.isDeleted! ? 1 : 0),
    'premium_user':
        instance.premiumUser == null ? null : (instance.premiumUser! ? 1 : 0)
  };
}

/// Construct a [Users]
class UsersAdapter extends OfflineFirstWithSupabaseAdapter<Users> {
  UsersAdapter();

  @override
  final supabaseTableName = 'users';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
    ),
    'userName': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_name',
    ),
    'email': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'email',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
    ),
    'profileUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'profile_url',
    ),
    'animalSprit': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'animal_sprit',
    ),
    'isDeleted': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'is_deleted',
    ),
    'premiumUser': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'premium_user',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'userId'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    ),
    'userName': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_name',
      iterable: false,
      type: String,
    ),
    'email': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'email',
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
    'profileUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'profile_url',
      iterable: false,
      type: String,
    ),
    'animalSprit': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'animal_sprit',
      iterable: false,
      type: String,
    ),
    'isDeleted': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'is_deleted',
      iterable: false,
      type: bool,
    ),
    'premiumUser': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'premium_user',
      iterable: false,
      type: bool,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      Users instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `Users` WHERE user_id = ? LIMIT 1''', [instance.userId]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Users';

  @override
  Future<Users> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UsersFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(Users input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UsersToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Users> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UsersFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(Users input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UsersToSqlite(input, provider: provider, repository: repository);
}
