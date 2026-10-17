import 'dart:convert';
import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/data/remote/api_constant.dart';
import 'package:animage/domain/entity/tag.dart';
import 'package:animage/domain/entity/tag_list_change_log.dart';
import 'package:animage/utils/log.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

const int requestTimeOut = 120;
const String tag = 'TagFetching';

Future<Iterable<Tag>> _fetchTags(String url) async {
  Response response = await get(Uri.parse(url))
      .timeout(const Duration(seconds: requestTimeOut));
  List<dynamic> responseList = jsonDecode(response.body);
  final resultList = responseList.map((responseData) {
    final tag = Tag.fromJson(responseData);
    return tag.count >= 0 ? tag : tag.copyWith(count: 0);
  });
  Log.d(
    tag,
    '\n-------------------\nGET $url\nResult: ${response.statusCode} - data: ${resultList.length} - ${resultList.map((tag) => tag.name)}\n-------------------',
  );
  return resultList;
}

void main() async {
  int page = 1;
  List<Tag> tagList = [];
  bool hasData = false;
  int successes = 0;
  int failures = 0;
  final stopwatch = Stopwatch()..start();
  List<String> failedUrls = [];

  do {
    Log.d(tag, 'Fetching page $page');
    String tagUrl =
        '${ApiConstant.baseUrl}/tag.json?${ApiConstant.apiVersionParam}=${ApiConstant.apiVersion}&${ApiConstant.page}=${page++}';
    try {
      final resultList = await _fetchTags(tagUrl);
      hasData = resultList.isNotEmpty;
      if (hasData) {
        tagList.addAll(resultList);
      }
      successes++;
    } catch (e) {
      Log.d(
        tag,
        '\n-------------------\nGET $tagUrl\nError: $e\n-------------------',
      );
      failures++;
      if (!failedUrls.contains(tagUrl)) {
        failedUrls.add(tagUrl);
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
          final resultList = await _fetchTags(url);
          hasData = resultList.isNotEmpty;
          if (hasData) {
            tagList.addAll(resultList);
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

  File result = File('$tagAssetPath/tag.json');
  if (!result.existsSync()) {
    result.createSync(recursive: true);
  }
  result.writeAsStringSync(jsonEncode(tagList).toString(), flush: true);

  DateTime finishTime = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  TagListChangeLog tagListChangeLog = TagListChangeLog(
    versionId: finishTime.microsecondsSinceEpoch.toString(),
    updatedAt: formatter.format(finishTime),
  );
  File changeLog = File('$tagAssetPath/tag_list_change_log.json');
  changeLog.writeAsStringSync(
    jsonEncode(tagListChangeLog).toString(),
    flush: true,
  );

  Log.d(
    tag,
    '\n-------------------\nFinish at ${tagListChangeLog.updatedAt}\nElapsed time: ${stopwatch.elapsed.inMinutes}\nSuccess pages=$successes\nFailed pages=$failures\n-------------------',
  );
  stopwatch.stop();
}
