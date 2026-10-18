import 'dart:convert';

import 'package:animage/constant.dart';
import 'package:animage/domain/entity/tag.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../utils/log.dart';

const tagQueryKey = 'tag_query';
const tagNamesKey = 'tag_names';
const availableTagsKey = 'available_tags';

const _requestTimeOut = Duration(seconds: 30);

class TagRepository {
  TagRepository._();

  static TagRepository instance = TagRepository._();

  static final Map<int, Tag> _tags = {};

  static Set<Tag> get tags => Set.of(_tags.values);

  static const String tag = 'TagRepository';

  Future<void> loadTags() async {
    _tags.clear();
    try {
      final String jsonString = await rootBundle.loadString(
        '$tagAssetPath/tag.json',
      );

      final List<dynamic> data = jsonDecode(jsonString);
      logD('Loaded ${data.length} tags', tag: tag);
      for (final tagData in data) {
        final Map<String, dynamic> jsonMap = tagData as Map<String, dynamic>;
        final tag = Tag.fromJson(jsonMap);
        _tags[tag.id] = tag;
      }
    } catch (e) {
      logE('Failed to load tags with error', error: e, tag: tag);
    }
    _syncWithRemoteData().ignore();
  }

  Future<void> _syncWithRemoteData() async {
    final url = '$configBaseUrl/tag.json';
    try {
      Response response = await get(Uri.parse(url)).timeout(_requestTimeOut);

      final List<dynamic> data = jsonDecode(response.body);
      logD('Synced ${data.length} tags', tag: tag);
      for (final tagData in data) {
        try {
          final Map<String, dynamic> jsonMap = tagData as Map<String, dynamic>;
          final tag = Tag.fromJson(jsonMap);
          _tags[tag.id] = tag;
        } catch (e) {
          logE('Failed to parse tag data $tagData', error: e, tag: tag);
        }
      }
      Log.d(
        tag,
        '\n-------------------\nGET $url\nResult: ${response.statusCode} - ${data.map((e) => e['name'])}\n-------------------',
      );
    } catch (e) {
      Log.d(
        tag,
        '\n-------------------\nGET $url\nError: $e\n-------------------',
      );
      rethrow;
    }
  }

  static List<Tag> getMatchedTags(Map<String, dynamic> data) {
    final query = data[tagQueryKey] as String?;
    final availableTags = data[availableTagsKey] as Set<Tag>?;
    if (query == null ||
        query.isEmpty ||
        availableTags == null ||
        availableTags.isEmpty) {
      return [];
    }

    final normalizedQuery = query.trim().toLowerCase();
    final pascalQuery = normalizedQuery.replaceAll(' ', '_');

    final filteredTags = availableTags.where((tag) {
      final normalizedTagName = tag.name.trim().toLowerCase();
      return normalizedTagName.contains(pascalQuery) ||
          normalizedTagName.contains(normalizedQuery);
    }).toList();

    filteredTags.sort((a, b) => b.count.compareTo(a.count));

    return List.unmodifiableOf(filteredTags);
  }

  static Map<String, int> getPostsCountForTags(Map<String, dynamic> data) {
    final tagNames = data[tagNamesKey] as List<String>?;
    final availableTags = data[availableTagsKey] as Set<Tag>?;
    if (tagNames == null ||
        tagNames.isEmpty ||
        availableTags == null ||
        availableTags.isEmpty) {
      return {};
    }

    Map<String, int> result = {};
    for (final tagName in tagNames) {
      final normalizedTagName = tagName.trim().toLowerCase();
      final pascalTagname = normalizedTagName.replaceAll(' ', '_');
      final matchedTag = availableTags.firstWhereOrNull((tag) {
        final targetTagName = tag.name;
        return targetTagName == pascalTagname ||
            targetTagName == normalizedTagName;
      });
      if (matchedTag != null) {
        result[tagName] = matchedTag.count;
      }
    }
    return result;
  }
}
