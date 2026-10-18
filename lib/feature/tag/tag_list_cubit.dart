import 'package:animage/data/repository/tag_repository.dart';
import 'package:animage/feature/tag/tag_list_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/log.dart';

class TagListCubit extends Cubit<TagListState> {
  new() : super(const TagListState());

  Future<void> updateQuery(String query) async {
    logD('updateQuery $query', tag: 'TagFilter');
    final matchedTags = await compute(TagRepository.getMatchedTags, {
      tagQueryKey: query,
      availableTagsKey: TagRepository.tags,
    });
    emit(state.copyWith(tags: matchedTags, query: query));
  }
}
