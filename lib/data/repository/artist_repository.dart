import 'dart:convert';

import 'package:animage/domain/entity/artist.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../constant.dart';
import '../../domain/entity/artist_list_change_log.dart';
import '../../domain/entity/post.dart';
import '../../utils/log.dart';

const String artistAssetPath = 'assets/master_data/artist';

const postsKey = 'posts';
const artistsKey = 'artists';

const _requestTimeOut = Duration(seconds: 30);

class ArtistRepository {
  ArtistRepository._();

  static ArtistRepository instance = ArtistRepository._();

  final Map<String, Artist> _artists = {};

  Map<String, Artist> get artists => Map.unmodifiable(_artists);

  static const String tag = 'ArtistRepository';

  static ArtistListChangeLog? _changeLog;

  static ArtistListChangeLog? get changeLog => _changeLog;

  Future<void> loadArtists() async {
    _artists.clear();
    try {
      final String jsonString = await rootBundle.loadString(
        '$artistAssetPath/artist.json',
      );

      final List<dynamic> data = jsonDecode(jsonString);
      logD('Loaded ${data.length} artists', tag: tag);
      for (final artistData in data) {
        final Map<String, dynamic> jsonMap = artistData as Map<String, dynamic>;
        final artist = Artist.fromJson(jsonMap);
        if (_artists.containsKey(artist.name)) {
          logD(
            'Duplicated artist name ${artist.name}\n- $artist\n- ${_artists[artist.name]}',
            tag: tag,
          );
        } else {
          _artists[artist.name] = artist;
        }
      }

      final String changeLogAssetString = await rootBundle.loadString(
        '$artistAssetPath/artist_list_change_log.json',
      );
      Map<String, dynamic> changeLogData = jsonDecode(changeLogAssetString);
      _changeLog = ArtistListChangeLog.fromJson(changeLogData);
    } catch (e) {
      logE('Failed to load artists with error', error: e, tag: tag);
    }
    _syncWithRemoteData().ignore();
  }

  Future<void> _syncWithRemoteData() async {
    final url = '$configBaseUrl/artist.json';
    final changeLogUrl = '$configBaseUrl/artist_list_change_log.json';
    try {
      Response response = await get(Uri.parse(url)).timeout(_requestTimeOut);

      final List<dynamic> data = jsonDecode(response.body);
      logD('Synced ${data.length} artists', tag: tag);
      for (final artistData in data) {
        try {
          final Map<String, dynamic> jsonMap =
              artistData as Map<String, dynamic>;
          final artist = Artist.fromJson(jsonMap);
          _artists[artist.name] = artist;
        } catch (e) {
          logE('Failed to parse artist data $artistData', error: e, tag: tag);
        }
      }
      logD(
        '\n-------------------\nGET $url\nResult: ${response.statusCode} - ${data.map((e) => e['name'])}\n-------------------',
        tag: tag,
      );

      Response changeLogResponse = await get(Uri.parse(changeLogUrl))
          .timeout(_requestTimeOut);
      Map<String, dynamic> changeLogData = jsonDecode(changeLogResponse.body);
      _changeLog = ArtistListChangeLog.fromJson(changeLogData);

      logD(
        '\n-------------------\nGET $changeLogUrl\nResult: ${changeLogResponse.statusCode} - $changeLogData\n-------------------',
        tag: tag,
      );
    } catch (e) {
      logE(
        '\n-------------------\nGET $url\nError: $e\n-------------------',
        tag: tag,
      );
      rethrow;
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
        Log.d(tag, 'Loaded artist of post ${post.id}');
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
