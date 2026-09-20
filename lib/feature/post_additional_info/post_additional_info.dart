import 'package:animage/domain/entity/artist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_additional_info.freezed.dart';

@freezed
abstract class PostAdditionalInfo with _$PostAdditionalInfo {
  const factory PostAdditionalInfo({
    @Default({}) Map<int, Artist> artistOfPost,
  }) = _PostAdditionalInfo;
}
