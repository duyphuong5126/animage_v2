import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';

part 'artist.g.dart';

@freezed
abstract class Artist with _$Artist {
  const factory Artist({
    @JsonKey(name: 'id') required int id,
    @Default('') @JsonKey(name: 'name') String name,
    @Default(null) @JsonKey(name: 'alias_id') int? aliasId,
    @Default(null) @JsonKey(name: 'group_id') int? groupId,
    @Default([]) @JsonKey(name: 'urls') List<String> urls,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}
