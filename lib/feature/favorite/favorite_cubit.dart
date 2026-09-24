import 'dart:async';

import 'package:animage/data/local/post_local_data_source.dart';
import 'package:animage/feature/favorite/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/enum/gallery_mode.dart';
import '../../utils/log.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  new() : super(const FavoriteState());

  final PostLocalDataSource _localDataSource = PostLocalDataSource.instance;

  void init() {
    unawaited(_init());
  }

  Future<void> _init() async {
    final favoriteIds = await _localDataSource.getFavoriteIds();
    emit(state.copyWith(favoriteCount: favoriteIds.length));
    await loadMore();
  }

  Future<void> loadMore() async {
    if (state.loading) {
      logD('Gallery is loading data');
      return;
    }
    emit(state.copyWith(loading: true));

    final currentPosts = [...state.posts];
    bool hasMoreData = true;
    try {
      final postList = await _localDataSource.getFavoriteList(
        currentPosts.length,
        25,
      );
      currentPosts.addAll(postList);
      hasMoreData = currentPosts.length < state.favoriteCount;
    } catch (e) {
      hasMoreData = false;
    }
    emit(
      state.copyWith(
        posts: currentPosts,
        loading: false,
        hasMoreData: hasMoreData,
      ),
    );
  }

  void changeMode(GalleryMode mode) {
    emit(state.copyWith(galleryMode: mode));
  }

  void reset() {
    emit(
      state.copyWith(
        favoriteCount: 0,
        posts: [],
        loading: false,
        hasMoreData: false,
      ),
    );
    unawaited(_init());
  }
}
