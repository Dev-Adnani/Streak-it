// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

// ignore: constant_identifier_names
const List<MigrationCommand> _migration_20250106102323_up = [
  InsertColumn('is_archived', Column.boolean, onTable: 'Habit')
];

// ignore: constant_identifier_names
const List<MigrationCommand> _migration_20250106102323_down = [
  DropColumn('is_archived', onTable: 'Habit')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250106102323',
  up: _migration_20250106102323_up,
  down: _migration_20250106102323_down,
)
class Migration20250106102323 extends Migration {
  const Migration20250106102323()
      : super(
          version: 20250106102323,
          up: _migration_20250106102323_up,
          down: _migration_20250106102323_down,
        );
}
