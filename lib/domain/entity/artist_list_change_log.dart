import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_list_change_log.freezed.dart';

part 'artist_list_change_log.g.dart';

@freezed
abstract class ArtistListChangeLog with _$ArtistListChangeLog {
  const factory ArtistListChangeLog({
    @JsonKey(name: 'current_version_id') required String versionId,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ArtistListChangeLog;

  factory ArtistListChangeLog.fromJson(Map<String, dynamic> json) =>
      _$ArtistListChangeLogFromJson(json);
}
