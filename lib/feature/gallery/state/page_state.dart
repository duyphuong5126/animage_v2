import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/post.dart';

part 'page_state.freezed.dart';

@freezed
sealed class PageState with _$PageState {
  const factory PageState.data({required List<Post> data}) = PageData;

  const factory PageState.error({Object? error}) = PageError;
}
