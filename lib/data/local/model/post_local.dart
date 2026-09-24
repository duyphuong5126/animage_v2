import 'package:drift/drift.dart';

class PostLocal extends Table {
  IntColumn get id => integer()();

  TextColumn get raw => text()();

  BoolColumn get isFavorite => boolean().clientDefault(() => false)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
