import 'package:animage/data/repository/artist_repository.dart';
import 'package:animage/domain/entity/post.dart';
import 'package:animage/feature/post_additional_info/post_additional_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/artist.dart';
import '../../utils/log.dart';

class PostAdditionalInfoCubit extends Cubit<PostAdditionalInfo> {
  new() : super(const PostAdditionalInfo());

  Future<void> processPosts(List<Post> posts) async {
    Map<int, Artist> artistOfPost = {...state.artistOfPost};

    for (final post in posts) {
      if (artistOfPost.containsKey(post.id)) {
        logD('Loaded artist of post ${post.id}');
      } else {
        final artist = await compute(ArtistRepository.getArtist, {
          postKey: post,
          artistsKey: ArtistRepository.instance.artists,
        });
        if (artist != null) {
          artistOfPost[post.id] = artist;
        }
      }
    }

    emit(state.copyWith(artistOfPost: artistOfPost));
  }
}
