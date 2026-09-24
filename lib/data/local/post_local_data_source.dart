import 'dart:convert';

import 'package:animage/data/local/animage_database.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:drift/drift.dart';

class PostLocalDataSource {
  PostLocalDataSource._() {
    _database = AnimageDatabase();
  }

  static PostLocalDataSource instance = PostLocalDataSource._();

  late final AnimageDatabase _database;

  Future<List<int>> getFavoriteIds() async {
    final selection = _database.select(_database.postLocal)
      ..where((table) => table.isFavorite);

    final result = await selection.get();
    return result.map((local) => local.id).toList();
  }

  Future<List<Post>> getFavoriteList(int skip, int take) async {
    final selection = _database.select(_database.postLocal)
      ..where((table) => table.isFavorite)
      ..limit(take, offset: skip);

    final result = await selection.get();
    return result.map((local) => Post.fromJson(jsonDecode(local.raw))).toList();
  }

  Future<bool> addFavoritePost(Post post) async {
    final result = await _database
        .into(_database.postLocal)
        .insert(
          PostLocalCompanion.insert(
            id: Value(post.id),
            raw: jsonEncode(post.toJson()),
            isFavorite: Value(true),
          ),
          mode: InsertMode.replace,
        );
    return result > 0;
  }

  Future<bool> removeFavoritePost(Post post) async {
    final result = await _database
        .into(_database.postLocal)
        .insert(
          PostLocalCompanion.insert(
            id: Value(post.id),
            raw: jsonEncode(post.toJson()),
            isFavorite: Value(false),
          ),
          mode: InsertMode.replace,
        );
    return result > 0;
  }
}
