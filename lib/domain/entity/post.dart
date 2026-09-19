import 'dart:math';

import 'package:animage/constant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'tags') @Default(null) String? tags,
    @JsonKey(name: 'created_at') @Default(null) int? createdAt,
    @JsonKey(name: 'updated_at') @Default(null) int? updatedAt,
    @JsonKey(name: 'creator_id') @Default(null) int? creatorId,
    @JsonKey(name: 'approver_id') @Default(null) int? approverId,
    @JsonKey(name: 'author') @Default(null) String? author,
    @JsonKey(name: 'change') @Default(null) int? change,
    @JsonKey(name: 'source') @Default(null) String? source,
    @JsonKey(name: 'score') @Default(null) int? score,
    @JsonKey(name: 'md5') @Default(null) String? md5,
    @JsonKey(name: 'file_size') @Default(null) int? fileSize,
    @JsonKey(name: 'file_ext') @Default(null) String? fileExt,
    @JsonKey(name: 'file_url') @Default(null) String? fileUrl,
    @JsonKey(name: 'is_shown_in_index') @Default(null) bool? isShownInIndex,
    @JsonKey(name: 'preview_url') @Default(null) String? previewUrl,
    @JsonKey(name: 'preview_width') @Default(null) int? previewWidth,
    @JsonKey(name: 'preview_height') @Default(null) int? previewHeight,
    @JsonKey(name: 'actual_preview_width')
    @Default(null)
    int? actualPreviewWidth,
    @JsonKey(name: 'actual_preview_height')
    @Default(null)
    int? actualPreviewHeight,
    @JsonKey(name: 'sample_url') @Default(null) String? sampleUrl,
    @JsonKey(name: 'sample_width') @Default(null) int? sampleWidth,
    @JsonKey(name: 'sample_height') @Default(null) int? sampleHeight,
    @JsonKey(name: 'sample_file_size') @Default(null) int? sampleFileSize,
    @JsonKey(name: 'jpeg_url') @Default(null) String? jpegUrl,
    @JsonKey(name: 'jpeg_width') @Default(null) int? jpegWidth,
    @JsonKey(name: 'jpeg_height') @Default(null) int? jpegHeight,
    @JsonKey(name: 'jpeg_file_size') @Default(null) int? jpegFileSize,
    @JsonKey(name: 'rating') @Default(null) String? rating,
    @JsonKey(name: 'is_rating_locked') @Default(null) bool? isRatingLocked,
    @JsonKey(name: 'has_children') @Default(null) bool? hasChildren,
    @JsonKey(name: 'parent_id') @Default(null) int? parentId,
    @JsonKey(name: 'status') @Default(null) String? status,
    @JsonKey(name: 'is_pending') @Default(null) bool? isPending,
    @JsonKey(name: 'width') @Default(null) int? width,
    @JsonKey(name: 'height') @Default(null) int? height,
    @JsonKey(name: 'is_held') @Default(null) bool? isHeld,
    @JsonKey(name: 'frames_pending_string')
    @Default(null)
    String? framesPendingString,

    // Todo - what are these properties?
    /*@JsonKey(name: 'frames_pending') @Default(null) List<String>? framesPending,
    @JsonKey(name: 'frames_string') @Default(null) String? framesString,
    @JsonKey(name: 'frames') @Default(null) List<String>? frames,*/
    @JsonKey(name: 'is_note_locked') @Default(null) bool? isNoteLocked,
    @JsonKey(name: 'last_noted_at') @Default(null) int? lastNotedAt,
    @JsonKey(name: 'last_commented_at') @Default(null) int? lastCommentedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

final DateFormat _uiTimeFormatter = DateFormat('MMM d, yyyy - HH:mm:ss');

extension PostEntityExtension on Post {
  List<String> get tagList {
    return tags?.split(' ') ?? [];
  }

  double get sampleAspectRatio {
    double width = sampleWidth?.toDouble() ?? 0.0;
    double height = sampleHeight?.toDouble() ?? 0.0;
    return width > 0 && height > 0 ? width.toDouble() / height : 0;
  }

  String get shareUrl {
    return '$postShareUrl/$id';
  }

  String get postId => "Post #${this.id}";

  String get ratingLabel {
    String ratingString = rating != null ? rating!.toLowerCase() : '';
    if (ratingString == 's') {
      return 'Rating: Safe';
    } else if (ratingString == 'q') {
      return 'Rating: Questionable';
    } else if (ratingString == 'e') {
      return 'Rating: Explicit';
    } else {
      return 'Rating: Unknown';
    }
  }

  String get sourceLabel {
    return 'Source: ${source ?? 'Unknown'}';
  }

  String get fileSizeLabel {
    final size = fileSize;
    if (size == null) {
      return 'File size: Unknown';
    }

    return 'File size: ${_formatFileSize(size)}';
  }

  String _formatFileSize(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return '0 B';

    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(1024)).floor();

    // Ensure we don't go out of bounds of the array
    i = min(i, suffixes.length - 1);

    var size = bytes / pow(1024, i);
    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  String get createdAtTimeStamp {
    int? createdAt = this.createdAt;
    return createdAt != null
        ? 'Created at: ${_uiTimeFormatter.format(DateTime.fromMillisecondsSinceEpoch(createdAt * 1000))}'
        : '';
  }

  String get updatedAtTimeStamp {
    int? updatedAt = this.updatedAt;
    return updatedAt != null
        ? 'Updated at: ${_uiTimeFormatter.format(DateTime.fromMillisecondsSinceEpoch(updatedAt * 1000))}'
        : '';
  }
}
