import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saver_gallery/saver_gallery.dart';

part 'post_download_state.freezed.dart';

@freezed
sealed class PostDownloadState with _$PostDownloadState {
  const factory PostDownloadState.downloading() = DownloadingState;

  const factory PostDownloadState.finished({required SaveResult savedResult}) =
      DownloadFinishedState;

  const factory PostDownloadState.permissionNotGranted() =
      PermissionNotGrantedState;
}
