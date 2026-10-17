import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'model/post_local.dart';
import 'model/selected_tag.dart';

part 'animage_database.g.dart';

@DriftDatabase(tables: [PostLocal, SelectedTag])
class AnimageDatabase extends _$AnimageDatabase {
  AnimageDatabase._([QueryExecutor? executor])
    : super(executor ?? _defaultExecutor());

  static AnimageDatabase instance = AnimageDatabase._();

  static QueryExecutor _defaultExecutor() {
    return driftDatabase(
      name: 'AnimageDatabase',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator migrator) async {
        await migrator.createAll();
      },
      onUpgrade: (Migrator migrator, int from, int to) async {
        if (from < 2) {
          await migrator.createTable(selectedTag);
        }
      },
    );
  }
}
