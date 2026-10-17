import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

part 'tag.g.dart';

@freezed
abstract class Tag with _$Tag {
  const factory Tag({
    @JsonKey(name: 'id') required int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default(0) @JsonKey(name: 'type') int type,
    @Default(false) @JsonKey(name: 'ambiguous') bool ambiguous,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
