import 'package:animage/domain/entity/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_list_state.freezed.dart';

@freezed
abstract class TagListState with _$TagListState {
  const factory TagListState({
    @Default([]) List<Tag> tags,
    @Default('') String query,
  }) = _TagListState;
}
