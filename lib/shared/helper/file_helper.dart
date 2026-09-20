import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:saver_gallery/saver_gallery.dart';

import '../../domain/entity/post.dart';
import '../../feature/downloader/post_download_state.dart';
import '../../utils/log.dart';

enum MediaType { image, video, audio }

class FileHelper {
  const FileHelper();

  Future<bool> _checkAndRequestPermissions({
    required bool skipIfExists,
    MediaType mediaType = MediaType.image,
  }) async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      return false; // Only Android and iOS platforms are supported
    }

    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = deviceInfo.version.sdkInt;

      if (sdkInt < 29) {
        return await Permission.storage.request().isGranted;
      }

      if (!skipIfExists) {
        return true;
      }

      if (sdkInt < 33) {
        return await Permission.storage.request().isGranted;
      }

      switch (mediaType) {
        case MediaType.image:
          return await Permission.photos.request().isGranted;
        case MediaType.video:
          return await Permission.videos.request().isGranted;
        case MediaType.audio:
          return await Permission.audio.request().isGranted;
      }
    } else if (Platform.isIOS) {
      // iOS permission for saving images to the gallery
      return skipIfExists
          ? await Permission.photos.request().isGranted
          : await Permission.photosAddOnly.request().isGranted;
    }

    return false; // Unsupported platforms
  }

  Future<PostDownloadState> downloadFileOfPost(
    Post post, {
    String? album,
  }) async {
    final fileUrl = post.fileUrl;
    if (fileUrl == null) {
      return PostDownloadState.finished(
        savedResult: SaveResult(false, 'File url is null'),
      );
    }
    try {
      final hasPermission = await _checkAndRequestPermissions(
        skipIfExists: true,
        mediaType: MediaType.image,
      );
      if (!hasPermission) {
        return PostDownloadState.permissionNotGranted();
      }
      var response = await Dio().get(
        fileUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      // Parse into a Uri object
      final uri = Uri.parse(fileUrl);

      // Extract the last path segment
      final fileName = uri.pathSegments.isNotEmpty
          ? '${post.id}_${uri.pathSegments.last.trim().replaceAll(' ', '_')}'
          : '${post.id}';

      final albumPath = "Animage${album != null ? '/$album' : ''}";
      logE('Download file $fileUrl into $albumPath/$fileName');
      final result = await SaverGallery.saveImage(
        Uint8List.fromList(response.data),
        fileName: fileName,
        albumPath: albumPath,
        skipIfExists: true,
      );
      return PostDownloadState.finished(savedResult: result);
    } catch (e) {
      logE('Failed to download file $fileUrl', error: e);
      return PostDownloadState.finished(
        savedResult: SaveResult(false, 'Failed to download file with error $e'),
      );
    }
  }
}
