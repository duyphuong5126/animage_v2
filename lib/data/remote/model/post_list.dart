import 'package:animage/domain/entity/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list.freezed.dart';

part 'post_list.g.dart';

@freezed
abstract class PostList with _$PostList {
  const factory PostList({@JsonKey(name: 'posts') required List<Post> posts}) =
      _PostList;

  factory PostList.fromJson(Map<String, dynamic> json) =>
      _$PostListFromJson(json);
}
