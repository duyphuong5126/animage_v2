import 'dart:convert';

import 'package:animage/constant.dart';
import 'package:animage/domain/entity/tag.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

import '../../utils/log.dart';

const tagQueryKey = 'tag_query';
const tagNamesKey = 'tag_names';
const availableTagsKey = 'available_tags';

class TagRepository {
  TagRepository._();

  static TagRepository instance = TagRepository._();

  static final Set<Tag> _tags = {};

  static Set<Tag> get tags => Set.of(_tags);

  Future<void> loadTags() async {
    _tags.clear();
    try {
      final String jsonString = await rootBundle.loadString(
        '$tagAssetPath/tag.json',
      );

      final List<dynamic> data = jsonDecode(jsonString);
      logD('Loaded ${data.length} tags');
      for (final tagData in data) {
        final Map<String, dynamic> jsonMap = tagData as Map<String, dynamic>;
        final tag = Tag.fromJson(jsonMap);
        _tags.add(tag);
      }
    } catch (e) {
      logE('Failed to load tags with error', error: e);
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
