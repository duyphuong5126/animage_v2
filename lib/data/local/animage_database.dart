import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'model/post_local.dart';

part 'animage_database.g.dart';

@DriftDatabase(tables: [PostLocal])
class AnimageDatabase extends _$AnimageDatabase {
  AnimageDatabase([QueryExecutor? executor])
    : super(executor ?? _defaultExecutor());

  static QueryExecutor _defaultExecutor() {
    return driftDatabase(
      name: 'AnimageDatabase',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  int get schemaVersion => 1;
}
