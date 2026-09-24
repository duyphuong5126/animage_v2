import 'dart:async';

import 'package:animage/data/local/post_local_data_source.dart';
import 'package:animage/data/repository/artist_repository.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/post_additional_info/post_additional_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/artist.dart';
import '../../utils/log.dart';

class PostAdditionalInfoCubit extends Cubit<PostAdditionalInfo> {
  new() : super(const PostAdditionalInfo());

  final PostLocalDataSource _localDataSource = PostLocalDataSource.instance;

  void init() {
    unawaited(_initFavorites());
  }

  Future<void> _initFavorites() async {
    try {
      final favoriteIds = await _localDataSource.getFavoriteIds();
      logD('favoriteIds=$favoriteIds');
      emit(state.copyWith(favoriteIds: Set.from(favoriteIds)));
    } catch (e) {
      logE('Failed to get favorite IDs with error', error: e);
    }
  }

  Future<void> processPosts(List<Post> posts) async {
    Map<int, Artist> artistOfPost = {...state.artistOfPost};

    final newArtistOfPost = await compute(ArtistRepository.getArtistOfPosts, {
      postsKey: posts,
      artistsKey: ArtistRepository.instance.artists,
    });

    artistOfPost.addAll(newArtistOfPost);

    emit(state.copyWith(artistOfPost: artistOfPost));
  }

  void updateFavorite(Post post, {required bool isFavorite}) {
    if (isFavorite) {
      unawaited(_addFavoritePost(post));
    } else {
      unawaited(_removeFavoritePost(post));
    }
  }

  Future<void> _addFavoritePost(Post post) async {
    try {
      final added = await _localDataSource.addFavoritePost(post);
      if (added) {
        final favIds = {...state.favoriteIds};
        favIds.add(post.id);
        emit(state.copyWith(favoriteIds: favIds));
      }
      logD('favorite added=$added');
    } catch (e) {
      logE('Failed to add favorite with error', error: e);
    }
  }

  Future<void> _removeFavoritePost(Post post) async {
    try {
      final removed = await _localDataSource.removeFavoritePost(post);
      if (removed) {
        final favIds = {...state.favoriteIds};
        favIds.remove(post.id);
        emit(state.copyWith(favoriteIds: favIds));
      }
      logD('favorite removed=$removed');
    } catch (e) {
      logE('Failed to remove favorite with error', error: e);
    }
  }
}
