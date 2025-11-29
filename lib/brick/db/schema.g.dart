// GENERATED CODE DO NOT EDIT
// This file should be version controlled
import 'package:brick_sqlite/db.dart';
part '20250124105216.migration.dart';
part '20250106102323.migration.dart';
part '20241223093810.migration.dart';
part '20250111202218.migration.dart';
part '20250111200307.migration.dart';
part '20241223093313.migration.dart';

/// All intelligently-generated migrations from all `@Migratable` classes on disk
final migrations = <Migration>{
  const Migration20250124105216(),
  const Migration20250106102323(),
  const Migration20241223093810(),
  const Migration20250111202218(),
  const Migration20250111200307(),
  const Migration20241223093313()
};

/// A consumable database structure including the latest generated migration.
final schema = Schema(20250124105216, generatorVersion: 1, tables: <SchemaTable>{
  SchemaTable('HabitCompletion', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('habit_completion_id', Column.varchar, unique: true),
    SchemaColumn('habit_id', Column.varchar),
    SchemaColumn('user_id', Column.varchar),
    SchemaColumn('per_day_completed_datetime', Column.varchar),
    SchemaColumn('updated_at', Column.datetime),
    SchemaColumn('created_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['habit_completion_id'], unique: true)
  }),
  SchemaTable('Habit', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('habit_id', Column.varchar, unique: true),
    SchemaColumn('user_id', Column.varchar),
    SchemaColumn('habit_name', Column.varchar),
    SchemaColumn('habit_description', Column.varchar),
    SchemaColumn('completions_goal', Column.integer),
    SchemaColumn('categories', Column.varchar),
    SchemaColumn('icon', Column.varchar),
    SchemaColumn('heat_map_color', Column.varchar),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime),
    SchemaColumn('reminder_days', Column.varchar),
    SchemaColumn('reminder_time', Column.datetime),
    SchemaColumn('interval_type', Column.varchar),
    SchemaColumn('completions_per_interval', Column.integer),
    SchemaColumn('is_archived', Column.boolean)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['habit_id'], unique: true),
    SchemaIndex(columns: ['user_id'], unique: false)
  }),
  SchemaTable('Users', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('user_id', Column.varchar, unique: true),
    SchemaColumn('user_name', Column.varchar),
    SchemaColumn('email', Column.varchar),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime),
    SchemaColumn('profile_url', Column.varchar),
    SchemaColumn('animal_sprit', Column.varchar),
    SchemaColumn('is_deleted', Column.boolean),
    SchemaColumn('premium_user', Column.boolean)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['user_id'], unique: true)
  }),
  SchemaTable('PremiumPlan', columns: <SchemaColumn>{
    SchemaColumn('_brick_id', Column.integer,
        autoincrement: true, nullable: false, isPrimaryKey: true),
    SchemaColumn('plan_id', Column.varchar, unique: true),
    SchemaColumn('user_id', Column.varchar),
    SchemaColumn('plan_type', Column.varchar),
    SchemaColumn('start_date', Column.datetime),
    SchemaColumn('end_date', Column.datetime),
    SchemaColumn('price', Column.Double),
    SchemaColumn('created_at', Column.datetime),
    SchemaColumn('updated_at', Column.datetime)
  }, indices: <SchemaIndex>{
    SchemaIndex(columns: ['plan_id'], unique: true),
    SchemaIndex(columns: ['user_id'], unique: false)
  })
});
