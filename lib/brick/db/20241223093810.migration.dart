// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
// ignore_for_file: constant_identifier_names

part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20241223093810_up = [
  DropColumn('habit_completion_id', onTable: 'HabitCompletion'),
  InsertColumn('habit_completion_id', Column.varchar,
      onTable: 'HabitCompletion', unique: true),
  CreateIndex(
      columns: ['habit_completion_id'],
      onTable: 'HabitCompletion',
      unique: true)
];

const List<MigrationCommand> _migration_20241223093810_down = [
  DropColumn('habit_completion_id', onTable: 'HabitCompletion'),
  DropIndex('index_HabitCompletion_on_habit_completion_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20241223093810',
  up: _migration_20241223093810_up,
  down: _migration_20241223093810_down,
)
class Migration20241223093810 extends Migration {
  const Migration20241223093810()
      : super(
          version: 20241223093810,
          up: _migration_20241223093810_up,
          down: _migration_20241223093810_down,
        );
}
