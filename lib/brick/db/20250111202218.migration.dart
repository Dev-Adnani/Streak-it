// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250111202218_up = [
  InsertTable('PremiumPlan'),
  InsertColumn('plan_id', Column.varchar, onTable: 'PremiumPlan', unique: true),
  InsertColumn('user_id', Column.varchar, onTable: 'PremiumPlan'),
  InsertColumn('plan_type', Column.varchar, onTable: 'PremiumPlan'),
  InsertColumn('start_date', Column.datetime, onTable: 'PremiumPlan'),
  InsertColumn('end_date', Column.datetime, onTable: 'PremiumPlan'),
  InsertColumn('price', Column.Double, onTable: 'PremiumPlan'),
  InsertColumn('created_at', Column.datetime, onTable: 'PremiumPlan'),
  InsertColumn('updated_at', Column.datetime, onTable: 'PremiumPlan'),
  CreateIndex(columns: ['plan_id'], onTable: 'PremiumPlan', unique: true),
  CreateIndex(columns: ['user_id'], onTable: 'PremiumPlan', unique: false)
];

const List<MigrationCommand> _migration_20250111202218_down = [
  DropTable('PremiumPlan'),
  DropColumn('plan_id', onTable: 'PremiumPlan'),
  DropColumn('user_id', onTable: 'PremiumPlan'),
  DropColumn('plan_type', onTable: 'PremiumPlan'),
  DropColumn('start_date', onTable: 'PremiumPlan'),
  DropColumn('end_date', onTable: 'PremiumPlan'),
  DropColumn('price', onTable: 'PremiumPlan'),
  DropColumn('created_at', onTable: 'PremiumPlan'),
  DropColumn('updated_at', onTable: 'PremiumPlan'),
  DropIndex('index_PremiumPlan_on_plan_id'),
  DropIndex('index_PremiumPlan_on_user_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250111202218',
  up: _migration_20250111202218_up,
  down: _migration_20250111202218_down,
)
class Migration20250111202218 extends Migration {
  const Migration20250111202218()
    : super(
        version: 20250111202218,
        up: _migration_20250111202218_up,
        down: _migration_20250111202218_down,
      );
}
