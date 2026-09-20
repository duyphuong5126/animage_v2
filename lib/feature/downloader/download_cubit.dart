import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/downloader/post_download_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saver_gallery/saver_gallery.dart';

import '../../shared/helper/file_helper.dart';
import '../../utils/log.dart';
import 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  new() : super(DownloadState());

  final FileHelper _fileHelper = FileHelper();

  Future<void> downloadPost(Post post) async {
    emit(
      state.copyWith(
        postDownloadingStatus: {
          ...state.postDownloadingStatus,
          post.id: PostDownloadState.downloading(),
        },
      ),
    );

    PostDownloadState downloadResult;
    try {
      downloadResult = await _fileHelper.downloadFileOfPost(post);
    } catch (e) {
      logE('Failed to load file of ${post.id} with error', error: e);
      downloadResult = PostDownloadState.finished(
        savedResult: SaveResult(false, 'Failed to download file with error $e'),
      );
    }

    emit(
      state.copyWith(
        postDownloadingStatus: {
          ...state.postDownloadingStatus,
          post.id: downloadResult,
        },
      ),
    );
  }
}
