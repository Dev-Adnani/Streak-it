// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250111200307_up = [
  InsertColumn('is_deleted', Column.boolean, onTable: 'Users'),
  InsertColumn('is_premium_user', Column.boolean, onTable: 'Users')
];

const List<MigrationCommand> _migration_20250111200307_down = [
  DropColumn('is_deleted', onTable: 'Users'),
  DropColumn('is_premium_user', onTable: 'Users')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250111200307',
  up: _migration_20250111200307_up,
  down: _migration_20250111200307_down,
)
class Migration20250111200307 extends Migration {
  const Migration20250111200307()
    : super(
        version: 20250111200307,
        up: _migration_20250111200307_up,
        down: _migration_20250111200307_down,
      );
}
