import 'dart:async';

import 'package:animage/domain/entity/gallery_level.dart';
import 'package:animage/feature/gallery/state/gallery_mode.dart';
import 'package:animage/feature/gallery/state/gallery_state.dart';
import 'package:animage/feature/gallery/state/page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/post_remote_data_source.dart';
import '../../utils/log.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(const GalleryState());

  final PostRemoteDataSource _remoteDataSource = PostRemoteDataSourceImpl();

  void init() {
    unawaited(loadPage(1));
  }

  Future<void> loadPage(int pageIndex) async {
    if (state.loading) {
      logD('Gallery is loading data');
      return;
    }
    if (state.pages.containsKey(pageIndex)) {
      logD('Page $pageIndex is already loaded');
      return;
    }
    emit(state.copyWith(loading: true));

    final currentPages = {...state.pages};
    bool hasMoreData = true;
    try {
      final postList = state.tags.isNotEmpty
          ? await _remoteDataSource.searchPostsByTag(
              state.tags,
              pageIndex,
              state.galleryLevel,
            )
          : await _remoteDataSource.getPostList(pageIndex, state.galleryLevel);
      currentPages[pageIndex] = PageData(data: postList);
    } catch (e) {
      currentPages[pageIndex] = PageError(error: e);
      hasMoreData = false;
    }
    emit(
      state.copyWith(
        loading: false,
        pages: currentPages,
        hasMoreData: hasMoreData,
      ),
    );
  }

  void search(String query) {
    final level = GalleryLevel.fromRawValue(query);
    if (level != null) {
      setLevel(level);
    } else {
      final normalizedTag = query.trim().toLowerCase();
      if (state.tags.contains(normalizedTag)) {
        logD('Tag $normalizedTag is being used');
        return;
      }
      emit(
        state.copyWith(
          pages: {},
          loading: false,
          hasMoreData: false,
          tags: [...state.tags, normalizedTag],
        ),
      );
      init();
    }
  }

  void changeMode(GalleryMode mode) {
    emit(state.copyWith(galleryMode: mode));
  }

  void removeTag(String tag) {
    final normalizedTag = tag.trim().toLowerCase();
    emit(
      state.copyWith(
        pages: {},
        loading: false,
        hasMoreData: false,
        tags: [...state.tags.where((addedTag) => addedTag != normalizedTag)],
      ),
    );
    init();
  }

  void setLevel(GalleryLevel level) {
    emit(
      state.copyWith(
        pages: {},
        loading: false,
        hasMoreData: false,
        galleryLevel: level,
      ),
    );
    init();
  }
}
