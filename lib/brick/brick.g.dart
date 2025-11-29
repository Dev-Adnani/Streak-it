// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_core/query.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/db.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/brick_sqlite.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_supabase/brick_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:uuid/uuid.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:streakit/brick/models/habit.completion.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:streakit/brick/models/habit.model.dart';// GENERATED CODE DO NOT EDIT
// ignore: unused_import
import 'dart:convert';
import 'package:brick_sqlite/brick_sqlite.dart' show SqliteModel, SqliteAdapter, SqliteModelDictionary, RuntimeSqliteColumnDefinition, SqliteProvider;
import 'package:brick_supabase/brick_supabase.dart' show SupabaseProvider, SupabaseModel, SupabaseAdapter, SupabaseModelDictionary;
// ignore: unused_import, unused_shown_name
import 'package:brick_offline_first/brick_offline_first.dart' show RuntimeOfflineFirstDefinition;
// ignore: unused_import, unused_shown_name
import 'package:sqflite_common/sqlite_api.dart' show DatabaseExecutor;

import '../brick/models/habit.completion.model.dart';
import '../brick/models/habit.model.dart';
import '../brick/models/users.model.dart';
import '../brick/models/premium.plan.model.dart';

part 'adapters/habit_completion_adapter.g.dart';
part 'adapters/habit_adapter.g.dart';
part 'adapters/users_adapter.g.dart';
part 'adapters/premium_plan_adapter.g.dart';

/// Supabase mappings should only be used when initializing a [SupabaseProvider]
final Map<Type, SupabaseAdapter<SupabaseModel>> supabaseMappings = {
  HabitCompletion: HabitCompletionAdapter(),
  Habit: HabitAdapter(),
  Users: UsersAdapter(),
  PremiumPlan: PremiumPlanAdapter()
};
final supabaseModelDictionary = SupabaseModelDictionary(supabaseMappings);

/// Sqlite mappings should only be used when initializing a [SqliteProvider]
final Map<Type, SqliteAdapter<SqliteModel>> sqliteMappings = {
  HabitCompletion: HabitCompletionAdapter(),
  Habit: HabitAdapter(),
  Users: UsersAdapter(),
  PremiumPlan: PremiumPlanAdapter()
};
final sqliteModelDictionary = SqliteModelDictionary(sqliteMappings);
