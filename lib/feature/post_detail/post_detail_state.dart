import 'package:animage/domain/entity/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_state.freezed.dart';

@freezed
abstract class PostDetailState with _$PostDetailState {
  const factory PostDetailState({
    required Post post,
    @Default([]) List<Post> children,
    @Default(false) bool loadingChildren,
  }) = _PostDetailState;
}
