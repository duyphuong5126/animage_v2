import 'package:collection/collection.dart';

enum GalleryLevel {
  safe(query: "rating:safe", value: "gallery:basic"),
  questionable(query: "rating:questionable", value: "gallery:more"),
  free(query: "rating:free", value: "gallery:all"); // In-app value

  GalleryLevel({required this.query, required this.value});

  final String query;
  final String value;

  static GalleryLevel? fromRawValue(String value) {
    return GalleryLevel.values.firstWhereOrNull(
      (level) => level.value == value || level.query == value,
    );
  }
}
