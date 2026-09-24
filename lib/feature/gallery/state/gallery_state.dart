import 'package:animage/domain/entity/gallery_level.dart';
import 'package:animage/shared/enum/gallery_mode.dart';
import 'package:collection/collection.dart';

import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/gallery/state/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_state.freezed.dart';

@freezed
abstract class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default({}) Map<int, PageState> pages,
    @Default(false) bool loading,
    @Default(false) bool hasMoreData,
    @Default(GalleryLevel.safe) GalleryLevel galleryLevel,
    @Default(GalleryMode.list) GalleryMode galleryMode,
    @Default([]) List<String> tags,
  }) = _GalleryState;
}

extension GalleryStateExtension on GalleryState {
  List<Post> get data => [
    for (final page in pages.values)
      if (page is PageData) ...page.data,
  ];

  int? get maxPageIndex => maxBy(pages.keys, (key) => key);
}
