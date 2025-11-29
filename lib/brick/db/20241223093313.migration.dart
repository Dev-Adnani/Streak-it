// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
// ignore_for_file: constant_identifier_names

part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20241223093313_up = [
  InsertTable('HabitCompletion'),
  InsertTable('Habit'),
  InsertTable('Users'),
  InsertColumn('habit_completion_id', Column.varchar,
      onTable: 'HabitCompletion'),
  InsertColumn('habit_id', Column.varchar, onTable: 'HabitCompletion'),
  InsertColumn('user_id', Column.varchar, onTable: 'HabitCompletion'),
  InsertColumn('per_day_completed_datetime', Column.varchar,
      onTable: 'HabitCompletion'),
  InsertColumn('updated_at', Column.datetime, onTable: 'HabitCompletion'),
  InsertColumn('created_at', Column.datetime, onTable: 'HabitCompletion'),
  InsertColumn('habit_id', Column.varchar, onTable: 'Habit', unique: true),
  InsertColumn('user_id', Column.varchar, onTable: 'Habit'),
  InsertColumn('habit_name', Column.varchar, onTable: 'Habit'),
  InsertColumn('habit_description', Column.varchar, onTable: 'Habit'),
  InsertColumn('completions_goal', Column.integer, onTable: 'Habit'),
  InsertColumn('categories', Column.varchar, onTable: 'Habit'),
  InsertColumn('icon', Column.varchar, onTable: 'Habit'),
  InsertColumn('heat_map_color', Column.varchar, onTable: 'Habit'),
  InsertColumn('created_at', Column.datetime, onTable: 'Habit'),
  InsertColumn('updated_at', Column.datetime, onTable: 'Habit'),
  InsertColumn('reminder_days', Column.varchar, onTable: 'Habit'),
  InsertColumn('reminder_time', Column.datetime, onTable: 'Habit'),
  InsertColumn('interval_type', Column.varchar, onTable: 'Habit'),
  InsertColumn('completions_per_interval', Column.integer, onTable: 'Habit'),
  InsertColumn('user_id', Column.varchar, onTable: 'Users', unique: true),
  InsertColumn('user_name', Column.varchar, onTable: 'Users'),
  InsertColumn('email', Column.varchar, onTable: 'Users'),
  InsertColumn('created_at', Column.datetime, onTable: 'Users'),
  InsertColumn('updated_at', Column.datetime, onTable: 'Users'),
  InsertColumn('profile_url', Column.varchar, onTable: 'Users'),
  InsertColumn('animal_sprit', Column.varchar, onTable: 'Users'),
  CreateIndex(columns: ['habit_id'], onTable: 'Habit', unique: true),
  CreateIndex(columns: ['user_id'], onTable: 'Habit', unique: false),
  CreateIndex(columns: ['user_id'], onTable: 'Users', unique: true)
];

const List<MigrationCommand> _migration_20241223093313_down = [
  DropTable('HabitCompletion'),
  DropTable('Habit'),
  DropTable('Users'),
  DropColumn('habit_completion_id', onTable: 'HabitCompletion'),
  DropColumn('habit_id', onTable: 'HabitCompletion'),
  DropColumn('user_id', onTable: 'HabitCompletion'),
  DropColumn('per_day_completed_datetime', onTable: 'HabitCompletion'),
  DropColumn('updated_at', onTable: 'HabitCompletion'),
  DropColumn('created_at', onTable: 'HabitCompletion'),
  DropColumn('habit_id', onTable: 'Habit'),
  DropColumn('user_id', onTable: 'Habit'),
  DropColumn('habit_name', onTable: 'Habit'),
  DropColumn('habit_description', onTable: 'Habit'),
  DropColumn('completions_goal', onTable: 'Habit'),
  DropColumn('categories', onTable: 'Habit'),
  DropColumn('icon', onTable: 'Habit'),
  DropColumn('heat_map_color', onTable: 'Habit'),
  DropColumn('created_at', onTable: 'Habit'),
  DropColumn('updated_at', onTable: 'Habit'),
  DropColumn('reminder_days', onTable: 'Habit'),
  DropColumn('reminder_time', onTable: 'Habit'),
  DropColumn('interval_type', onTable: 'Habit'),
  DropColumn('completions_per_interval', onTable: 'Habit'),
  DropColumn('user_id', onTable: 'Users'),
  DropColumn('user_name', onTable: 'Users'),
  DropColumn('email', onTable: 'Users'),
  DropColumn('created_at', onTable: 'Users'),
  DropColumn('updated_at', onTable: 'Users'),
  DropColumn('profile_url', onTable: 'Users'),
  DropColumn('animal_sprit', onTable: 'Users'),
  DropIndex('index_Habit_on_habit_id'),
  DropIndex('index_Habit_on_user_id'),
  DropIndex('index_Users_on_user_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20241223093313',
  up: _migration_20241223093313_up,
  down: _migration_20241223093313_down,
)
class Migration20241223093313 extends Migration {
  const Migration20241223093313()
      : super(
          version: 20241223093313,
          up: _migration_20241223093313_up,
          down: _migration_20241223093313_down,
        );
}
