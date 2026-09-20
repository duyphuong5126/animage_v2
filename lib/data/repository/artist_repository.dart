import 'dart:convert';

import 'package:animage/domain/entity/artist.dart';
import 'package:flutter/services.dart';

import '../../domain/entity/post.dart';
import '../../utils/log.dart';

const String artistAssetPath = 'assets/master_data/artist';

const postKey = 'post';
const artistsKey = 'artists';

class ArtistRepository {
  ArtistRepository._();

  static ArtistRepository instance = ArtistRepository._();

  final Map<String, Artist> _artists = {};

  Map<String, Artist> get artists => Map.unmodifiable(_artists);

  Future<void> loadArtists() async {
    _artists.clear();
    try {
      final String jsonString = await rootBundle.loadString(
        '$artistAssetPath/artist.json',
      );

      final List<dynamic> data = jsonDecode(jsonString);
      logD('Loaded ${data.length} artists');
      for (final artistData in data) {
        final Map<String, dynamic> jsonMap = artistData as Map<String, dynamic>;
        final artist = Artist.fromJson(jsonMap);
        if (_artists.containsKey(artist.name)) {
          logD(
            'Duplicated artist name ${artist.name}\n- $artist\n- ${_artists[artist.name]}',
          );
        } else {
          _artists[artist.name] = artist;
        }
      }
    } catch (e) {
      logE('Failed to load artists with error', error: e);
    }
  }

  static Artist? getArtist(Map<String, dynamic> data) {
    final post = data[postKey] as Post;
    final availableArtists = data[artistsKey] as Map<String, Artist>;

    final artistNames = availableArtists.keys;

    Log.d('Artist', 'tagList=${post.tagList}');
    for (final tag in post.tagList) {
      final normalizedTag = tag.trim();

      if (artistNames.contains(normalizedTag)) {
        return availableArtists[normalizedTag];
      }
    }
    return null;
  }
}
