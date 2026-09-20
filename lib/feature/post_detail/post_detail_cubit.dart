import 'dart:async';

import 'package:animage/data/remote/post_remote_data_source.dart';
import 'package:animage/domain/entity/gallery_level.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/post_detail/post_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  new(Post post) : super(PostDetailState(post: post));

  final PostRemoteDataSource _remoteDataSource = PostRemoteDataSourceImpl();

  void init() {
    unawaited(_loadPostDetails());
  }

  Future<void> _loadPostDetails() async {
    if (state.post.hasChildren != true) {
      return;
    }
    emit(state.copyWith(loadingChildren: true));
    try {
      final children = await _remoteDataSource.searchPostsByTag(
        ['parent:${state.post.id}'],
        1,
        GalleryLevel.free,
      );
      emit(state.copyWith(children: children, loadingChildren: false));
    } catch (e) {
      emit(state.copyWith(children: [], loadingChildren: false));
    }
  }
}
