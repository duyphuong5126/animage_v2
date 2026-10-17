import 'package:drift/drift.dart';

import 'animage_database.dart';

class SelectedTagLocalDataSource {
  SelectedTagLocalDataSource._() {
    _database = AnimageDatabase.instance;
  }

  static SelectedTagLocalDataSource instance = SelectedTagLocalDataSource._();

  late final AnimageDatabase _database;

  Future<List<String>> getSelectedTags() async {
    final localList = await _database.select(_database.selectedTag).get();
    return localList.map((tag) => tag.name).toList();
  }

  Future<bool> addTag(String tag) async {
    final result = await _database
        .into(_database.selectedTag)
        .insert(
          SelectedTagCompanion.insert(name: tag),
          mode: InsertMode.replace,
        );
    return result > 0;
  }

  Future<bool> removeTag(String tag) async {
    final result = await (_database.delete(
      _database.selectedTag,
    )..where((row) => row.name.equals(tag))).go();
    return result >= 0;
  }
}
