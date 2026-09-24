import 'dart:convert';

import 'package:animage/domain/entity/artist.dart';
import 'package:flutter/services.dart';

import '../../domain/entity/post.dart';
import '../../utils/log.dart';

const String artistAssetPath = 'assets/master_data/artist';

const postsKey = 'posts';
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

  static Map<int, Artist> getArtistOfPosts(Map<String, dynamic> data) {
    Map<int, Artist> artists = {};

    List<Post> posts = data[postsKey] as List<Post>;
    Map<String, Artist> availableArtists =
        data[artistsKey] as Map<String, Artist>;

    final artistNames = availableArtists.keys;

    for (final post in posts) {
      if (artists.containsKey(post.id)) {
        Log.d('Artist', 'Loaded artist of post ${post.id}');
      } else {
        Artist? artist;
        final tagList = post.tagList;
        for (int index = 0; index < tagList.length && artist == null; index++) {
          final normalizedTag = tagList[index].trim();

          if (artistNames.contains(normalizedTag)) {
            artist = availableArtists[normalizedTag];
          }
        }
        if (artist != null) {
          artists[post.id] = artist;
        }
      }
    }

    return artists;
  }
}
