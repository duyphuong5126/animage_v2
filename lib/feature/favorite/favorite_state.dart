import 'package:animage/domain/entity/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/enum/gallery_mode.dart';

part 'favorite_state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(0) int favoriteCount,
    @Default([]) List<Post> posts,
    @Default(false) bool loading,
    @Default(false) bool hasMoreData,
    @Default(GalleryMode.list) GalleryMode galleryMode,
    @Default(null) Object? error,
  }) = _FavoriteState;
}
