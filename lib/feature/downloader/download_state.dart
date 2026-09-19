import 'package:animage/feature/downloader/post_download_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_state.freezed.dart';

@freezed
abstract class DownloadState with _$DownloadState {
  const factory DownloadState({
    @Default({}) Map<int, PostDownloadState> postDownloadingStatus,
  }) = _DownloadState;
}
