import 'package:animage/domain/entity/gallery_level.dart';
import 'package:animage/shared/enum/gallery_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _galleryModeKey = 'gallery_mode';
  static const String _galleryLevelKey = 'gallery_level';

  static Future<bool> setGalleryModeValue(GalleryMode mode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final modeValue = switch (mode) {
      GalleryMode.list => 'list',
      GalleryMode.grid => 'grid',
    };

    return prefs.setString(_galleryModeKey, modeValue);
  }

  static Future<bool> setGalleryLevelValue(GalleryLevel level) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_galleryLevelKey, level.value);
  }

  static Future<GalleryMode?> getGalleryMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final modeValue = prefs.getString(_galleryModeKey);

    return switch (modeValue) {
      'list' => GalleryMode.list,
      'grid' => GalleryMode.grid,
      _ => null,
    };
  }

  static Future<GalleryLevel?> getGalleryLevel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final levelValue = prefs.getString(_galleryLevelKey);

    return levelValue != null ? GalleryLevel.fromRawValue(levelValue) : null;
  }
}
