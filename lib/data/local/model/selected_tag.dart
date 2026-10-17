import 'package:drift/drift.dart';

class SelectedTag extends Table {
  TextColumn get name => text()();

  @override
  Set<Column<Object>> get primaryKey => {name};
}
