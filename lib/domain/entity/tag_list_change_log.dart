import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_list_change_log.freezed.dart';

part 'tag_list_change_log.g.dart';

@freezed
abstract class TagListChangeLog with _$TagListChangeLog {
  const factory TagListChangeLog({
    @JsonKey(name: 'current_version_id') required String versionId,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _TagListChangeLog;

  factory TagListChangeLog.fromJson(Map<String, dynamic> json) =>
      _$TagListChangeLogFromJson(json);
}
