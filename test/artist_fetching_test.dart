import 'dart:convert';
import 'dart:io';

import 'package:animage/data/remote/api_constant.dart';
import 'package:animage/domain/entity/artist.dart';
import 'package:animage/domain/entity/artist_list_change_log.dart';
import 'package:animage/data/repository/artist_repository.dart';
import 'package:animage/utils/log.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

const int requestTimeOut = 120;
const String tag = 'ArtistFetching';

Future<Iterable<Artist>> _fetchArtists(String url) async {
  Response response = await get(Uri.parse(url))
      .timeout(const Duration(seconds: requestTimeOut));
  List<dynamic> responseList = jsonDecode(response.body);
  final resultList = responseList.map(
    (responseData) => Artist.fromJson(responseData),
  );
  Log.d(
    tag,
    '\n-------------------\nGET $url\nResult: ${response.statusCode} - data: ${resultList.length} - ${resultList.map((artist) => artist.id)}\n-------------------',
  );
  return resultList;
}

void main() async {
  int page = 1;
  List<Artist> artistList = [];
  bool hasData = false;
  int successes = 0;
  int failures = 0;
  final stopwatch = Stopwatch()..start();
  List<String> failedUrls = [];

  do {
    Log.d(tag, 'Fetching page $page');
    String artistUrl =
        '${ApiConstant.baseUrl}/artist.json?${ApiConstant.apiVersionParam}=${ApiConstant.apiVersion}&${ApiConstant.page}=${page++}';
    try {
      final resultList = await _fetchArtists(artistUrl);
      hasData = resultList.isNotEmpty;
      if (hasData) {
        artistList.addAll(resultList);
      }
      successes++;
    } catch (e) {
      Log.d(
        tag,
        '\n-------------------\nGET $artistUrl\nError: $e\n-------------------',
      );
      failures++;
      if (!failedUrls.contains(artistUrl)) {
        failedUrls.add(artistUrl);
      }
    }
    Log.d(tag, 'success pages=$successes, failed pages=$failures');
  } while (hasData);

  if (failedUrls.isNotEmpty) {
    Log.d(tag, 'retry fetching data from ${failedUrls.length} urls');
    do {
      final url = failedUrls.removeAt(0);
      bool success = false;
      for (int i = 0; i < 5 && !success; i++) {
        try {
          final resultList = await _fetchArtists(url);
          hasData = resultList.isNotEmpty;
          if (hasData) {
            artistList.addAll(resultList);
          }
          success = true;
        } catch (e) {
          Log.d(
            tag,
            '\n-------------------\nGET $url\nError: $e\n-------------------',
          );
        }
      }
    } while (failedUrls.isNotEmpty);
  }

  File result = File('$artistAssetPath/artist.json');
  if (!result.existsSync()) {
    result.createSync(recursive: true);
  }
  result.writeAsStringSync(jsonEncode(artistList).toString(), flush: true);

  DateTime finishTime = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  ArtistListChangeLog artistListChangeLog = ArtistListChangeLog(
    versionId: finishTime.microsecondsSinceEpoch.toString(),
    updatedAt: formatter.format(finishTime),
  );
  File changeLog = File('$artistAssetPath/artist_list_change_log.json');
  changeLog.writeAsStringSync(
    jsonEncode(artistListChangeLog).toString(),
    flush: true,
  );

  Log.d(
    tag,
    '\n-------------------\nFinish at ${artistListChangeLog.updatedAt}\nElapsed time: ${stopwatch.elapsed.inMinutes}\nSuccess pages=$successes\nFailed pages=$failures\n-------------------',
  );
  stopwatch.stop();
}
