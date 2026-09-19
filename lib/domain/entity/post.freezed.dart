// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'tags') String? get tags;@JsonKey(name: 'created_at') int? get createdAt;@JsonKey(name: 'updated_at') int? get updatedAt;@JsonKey(name: 'creator_id') int? get creatorId;@JsonKey(name: 'approver_id') int? get approverId;@JsonKey(name: 'author') String? get author;@JsonKey(name: 'change') int? get change;@JsonKey(name: 'source') String? get source;@JsonKey(name: 'score') int? get score;@JsonKey(name: 'md5') String? get md5;@JsonKey(name: 'file_size') int? get fileSize;@JsonKey(name: 'file_ext') String? get fileExt;@JsonKey(name: 'file_url') String? get fileUrl;@JsonKey(name: 'is_shown_in_index') bool? get isShownInIndex;@JsonKey(name: 'preview_url') String? get previewUrl;@JsonKey(name: 'preview_width') int? get previewWidth;@JsonKey(name: 'preview_height') int? get previewHeight;@JsonKey(name: 'actual_preview_width') int? get actualPreviewWidth;@JsonKey(name: 'actual_preview_height') int? get actualPreviewHeight;@JsonKey(name: 'sample_url') String? get sampleUrl;@JsonKey(name: 'sample_width') int? get sampleWidth;@JsonKey(name: 'sample_height') int? get sampleHeight;@JsonKey(name: 'sample_file_size') int? get sampleFileSize;@JsonKey(name: 'jpeg_url') String? get jpegUrl;@JsonKey(name: 'jpeg_width') int? get jpegWidth;@JsonKey(name: 'jpeg_height') int? get jpegHeight;@JsonKey(name: 'jpeg_file_size') int? get jpegFileSize;@JsonKey(name: 'rating') String? get rating;@JsonKey(name: 'is_rating_locked') bool? get isRatingLocked;@JsonKey(name: 'has_children') bool? get hasChildren;@JsonKey(name: 'parent_id') int? get parentId;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'is_pending') bool? get isPending;@JsonKey(name: 'width') int? get width;@JsonKey(name: 'height') int? get height;@JsonKey(name: 'is_held') bool? get isHeld;@JsonKey(name: 'frames_pending_string') String? get framesPendingString;@JsonKey(name: 'is_note_locked') bool? get isNoteLocked;@JsonKey(name: 'last_noted_at') int? get lastNotedAt;@JsonKey(name: 'last_commented_at') int? get lastCommentedAt;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Post;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tags, _this.tags) || other.tags == _this.tags)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.creatorId, _this.creatorId) || other.creatorId == _this.creatorId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.author, _this.author) || other.author == _this.author)&&(identical(other.change, _this.change) || other.change == _this.change)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.md5, _this.md5) || other.md5 == _this.md5)&&(identical(other.fileSize, _this.fileSize) || other.fileSize == _this.fileSize)&&(identical(other.fileExt, _this.fileExt) || other.fileExt == _this.fileExt)&&(identical(other.fileUrl, _this.fileUrl) || other.fileUrl == _this.fileUrl)&&(identical(other.isShownInIndex, _this.isShownInIndex) || other.isShownInIndex == _this.isShownInIndex)&&(identical(other.previewUrl, _this.previewUrl) || other.previewUrl == _this.previewUrl)&&(identical(other.previewWidth, _this.previewWidth) || other.previewWidth == _this.previewWidth)&&(identical(other.previewHeight, _this.previewHeight) || other.previewHeight == _this.previewHeight)&&(identical(other.actualPreviewWidth, _this.actualPreviewWidth) || other.actualPreviewWidth == _this.actualPreviewWidth)&&(identical(other.actualPreviewHeight, _this.actualPreviewHeight) || other.actualPreviewHeight == _this.actualPreviewHeight)&&(identical(other.sampleUrl, _this.sampleUrl) || other.sampleUrl == _this.sampleUrl)&&(identical(other.sampleWidth, _this.sampleWidth) || other.sampleWidth == _this.sampleWidth)&&(identical(other.sampleHeight, _this.sampleHeight) || other.sampleHeight == _this.sampleHeight)&&(identical(other.sampleFileSize, _this.sampleFileSize) || other.sampleFileSize == _this.sampleFileSize)&&(identical(other.jpegUrl, _this.jpegUrl) || other.jpegUrl == _this.jpegUrl)&&(identical(other.jpegWidth, _this.jpegWidth) || other.jpegWidth == _this.jpegWidth)&&(identical(other.jpegHeight, _this.jpegHeight) || other.jpegHeight == _this.jpegHeight)&&(identical(other.jpegFileSize, _this.jpegFileSize) || other.jpegFileSize == _this.jpegFileSize)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.isRatingLocked, _this.isRatingLocked) || other.isRatingLocked == _this.isRatingLocked)&&(identical(other.hasChildren, _this.hasChildren) || other.hasChildren == _this.hasChildren)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.isPending, _this.isPending) || other.isPending == _this.isPending)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.isHeld, _this.isHeld) || other.isHeld == _this.isHeld)&&(identical(other.framesPendingString, _this.framesPendingString) || other.framesPendingString == _this.framesPendingString)&&(identical(other.isNoteLocked, _this.isNoteLocked) || other.isNoteLocked == _this.isNoteLocked)&&(identical(other.lastNotedAt, _this.lastNotedAt) || other.lastNotedAt == _this.lastNotedAt)&&(identical(other.lastCommentedAt, _this.lastCommentedAt) || other.lastCommentedAt == _this.lastCommentedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Post;
  return Object.hashAll([runtimeType,_this.id,_this.tags,_this.createdAt,_this.updatedAt,_this.creatorId,_this.approverId,_this.author,_this.change,_this.source,_this.score,_this.md5,_this.fileSize,_this.fileExt,_this.fileUrl,_this.isShownInIndex,_this.previewUrl,_this.previewWidth,_this.previewHeight,_this.actualPreviewWidth,_this.actualPreviewHeight,_this.sampleUrl,_this.sampleWidth,_this.sampleHeight,_this.sampleFileSize,_this.jpegUrl,_this.jpegWidth,_this.jpegHeight,_this.jpegFileSize,_this.rating,_this.isRatingLocked,_this.hasChildren,_this.parentId,_this.status,_this.isPending,_this.width,_this.height,_this.isHeld,_this.framesPendingString,_this.isNoteLocked,_this.lastNotedAt,_this.lastCommentedAt]);
}

@override
String toString() {
  final _this = this as Post;
  return 'Post(id: ${_this.id}, tags: ${_this.tags}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, creatorId: ${_this.creatorId}, approverId: ${_this.approverId}, author: ${_this.author}, change: ${_this.change}, source: ${_this.source}, score: ${_this.score}, md5: ${_this.md5}, fileSize: ${_this.fileSize}, fileExt: ${_this.fileExt}, fileUrl: ${_this.fileUrl}, isShownInIndex: ${_this.isShownInIndex}, previewUrl: ${_this.previewUrl}, previewWidth: ${_this.previewWidth}, previewHeight: ${_this.previewHeight}, actualPreviewWidth: ${_this.actualPreviewWidth}, actualPreviewHeight: ${_this.actualPreviewHeight}, sampleUrl: ${_this.sampleUrl}, sampleWidth: ${_this.sampleWidth}, sampleHeight: ${_this.sampleHeight}, sampleFileSize: ${_this.sampleFileSize}, jpegUrl: ${_this.jpegUrl}, jpegWidth: ${_this.jpegWidth}, jpegHeight: ${_this.jpegHeight}, jpegFileSize: ${_this.jpegFileSize}, rating: ${_this.rating}, isRatingLocked: ${_this.isRatingLocked}, hasChildren: ${_this.hasChildren}, parentId: ${_this.parentId}, status: ${_this.status}, isPending: ${_this.isPending}, width: ${_this.width}, height: ${_this.height}, isHeld: ${_this.isHeld}, framesPendingString: ${_this.framesPendingString}, isNoteLocked: ${_this.isNoteLocked}, lastNotedAt: ${_this.lastNotedAt}, lastCommentedAt: ${_this.lastCommentedAt})';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'tags') String? tags,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt,@JsonKey(name: 'creator_id') int? creatorId,@JsonKey(name: 'approver_id') int? approverId,@JsonKey(name: 'author') String? author,@JsonKey(name: 'change') int? change,@JsonKey(name: 'source') String? source,@JsonKey(name: 'score') int? score,@JsonKey(name: 'md5') String? md5,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'file_ext') String? fileExt,@JsonKey(name: 'file_url') String? fileUrl,@JsonKey(name: 'is_shown_in_index') bool? isShownInIndex,@JsonKey(name: 'preview_url') String? previewUrl,@JsonKey(name: 'preview_width') int? previewWidth,@JsonKey(name: 'preview_height') int? previewHeight,@JsonKey(name: 'actual_preview_width') int? actualPreviewWidth,@JsonKey(name: 'actual_preview_height') int? actualPreviewHeight,@JsonKey(name: 'sample_url') String? sampleUrl,@JsonKey(name: 'sample_width') int? sampleWidth,@JsonKey(name: 'sample_height') int? sampleHeight,@JsonKey(name: 'sample_file_size') int? sampleFileSize,@JsonKey(name: 'jpeg_url') String? jpegUrl,@JsonKey(name: 'jpeg_width') int? jpegWidth,@JsonKey(name: 'jpeg_height') int? jpegHeight,@JsonKey(name: 'jpeg_file_size') int? jpegFileSize,@JsonKey(name: 'rating') String? rating,@JsonKey(name: 'is_rating_locked') bool? isRatingLocked,@JsonKey(name: 'has_children') bool? hasChildren,@JsonKey(name: 'parent_id') int? parentId,@JsonKey(name: 'status') String? status,@JsonKey(name: 'is_pending') bool? isPending,@JsonKey(name: 'width') int? width,@JsonKey(name: 'height') int? height,@JsonKey(name: 'is_held') bool? isHeld,@JsonKey(name: 'frames_pending_string') String? framesPendingString,@JsonKey(name: 'is_note_locked') bool? isNoteLocked,@JsonKey(name: 'last_noted_at') int? lastNotedAt,@JsonKey(name: 'last_commented_at') int? lastCommentedAt
});




}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tags = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? creatorId = freezed,Object? approverId = freezed,Object? author = freezed,Object? change = freezed,Object? source = freezed,Object? score = freezed,Object? md5 = freezed,Object? fileSize = freezed,Object? fileExt = freezed,Object? fileUrl = freezed,Object? isShownInIndex = freezed,Object? previewUrl = freezed,Object? previewWidth = freezed,Object? previewHeight = freezed,Object? actualPreviewWidth = freezed,Object? actualPreviewHeight = freezed,Object? sampleUrl = freezed,Object? sampleWidth = freezed,Object? sampleHeight = freezed,Object? sampleFileSize = freezed,Object? jpegUrl = freezed,Object? jpegWidth = freezed,Object? jpegHeight = freezed,Object? jpegFileSize = freezed,Object? rating = freezed,Object? isRatingLocked = freezed,Object? hasChildren = freezed,Object? parentId = freezed,Object? status = freezed,Object? isPending = freezed,Object? width = freezed,Object? height = freezed,Object? isHeld = freezed,Object? framesPendingString = freezed,Object? isNoteLocked = freezed,Object? lastNotedAt = freezed,Object? lastCommentedAt = freezed,}) {
  return _then(Post(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as int?,approverId: freezed == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as int?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,md5: freezed == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,fileExt: freezed == fileExt ? _self.fileExt : fileExt // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,isShownInIndex: freezed == isShownInIndex ? _self.isShownInIndex : isShownInIndex // ignore: cast_nullable_to_non_nullable
as bool?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,previewWidth: freezed == previewWidth ? _self.previewWidth : previewWidth // ignore: cast_nullable_to_non_nullable
as int?,previewHeight: freezed == previewHeight ? _self.previewHeight : previewHeight // ignore: cast_nullable_to_non_nullable
as int?,actualPreviewWidth: freezed == actualPreviewWidth ? _self.actualPreviewWidth : actualPreviewWidth // ignore: cast_nullable_to_non_nullable
as int?,actualPreviewHeight: freezed == actualPreviewHeight ? _self.actualPreviewHeight : actualPreviewHeight // ignore: cast_nullable_to_non_nullable
as int?,sampleUrl: freezed == sampleUrl ? _self.sampleUrl : sampleUrl // ignore: cast_nullable_to_non_nullable
as String?,sampleWidth: freezed == sampleWidth ? _self.sampleWidth : sampleWidth // ignore: cast_nullable_to_non_nullable
as int?,sampleHeight: freezed == sampleHeight ? _self.sampleHeight : sampleHeight // ignore: cast_nullable_to_non_nullable
as int?,sampleFileSize: freezed == sampleFileSize ? _self.sampleFileSize : sampleFileSize // ignore: cast_nullable_to_non_nullable
as int?,jpegUrl: freezed == jpegUrl ? _self.jpegUrl : jpegUrl // ignore: cast_nullable_to_non_nullable
as String?,jpegWidth: freezed == jpegWidth ? _self.jpegWidth : jpegWidth // ignore: cast_nullable_to_non_nullable
as int?,jpegHeight: freezed == jpegHeight ? _self.jpegHeight : jpegHeight // ignore: cast_nullable_to_non_nullable
as int?,jpegFileSize: freezed == jpegFileSize ? _self.jpegFileSize : jpegFileSize // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String?,isRatingLocked: freezed == isRatingLocked ? _self.isRatingLocked : isRatingLocked // ignore: cast_nullable_to_non_nullable
as bool?,hasChildren: freezed == hasChildren ? _self.hasChildren : hasChildren // ignore: cast_nullable_to_non_nullable
as bool?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isPending: freezed == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,isHeld: freezed == isHeld ? _self.isHeld : isHeld // ignore: cast_nullable_to_non_nullable
as bool?,framesPendingString: freezed == framesPendingString ? _self.framesPendingString : framesPendingString // ignore: cast_nullable_to_non_nullable
as String?,isNoteLocked: freezed == isNoteLocked ? _self.isNoteLocked : isNoteLocked // ignore: cast_nullable_to_non_nullable
as bool?,lastNotedAt: freezed == lastNotedAt ? _self.lastNotedAt : lastNotedAt // ignore: cast_nullable_to_non_nullable
as int?,lastCommentedAt: freezed == lastCommentedAt ? _self.lastCommentedAt : lastCommentedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Post].
extension PostPatterns on Post {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Post value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Post value)  $default,){
final _that = this;
switch (_that) {
case _Post():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Post value)?  $default,){
final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'tags')  String? tags, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt, @JsonKey(name: 'creator_id')  int? creatorId, @JsonKey(name: 'approver_id')  int? approverId, @JsonKey(name: 'author')  String? author, @JsonKey(name: 'change')  int? change, @JsonKey(name: 'source')  String? source, @JsonKey(name: 'score')  int? score, @JsonKey(name: 'md5')  String? md5, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_ext')  String? fileExt, @JsonKey(name: 'file_url')  String? fileUrl, @JsonKey(name: 'is_shown_in_index')  bool? isShownInIndex, @JsonKey(name: 'preview_url')  String? previewUrl, @JsonKey(name: 'preview_width')  int? previewWidth, @JsonKey(name: 'preview_height')  int? previewHeight, @JsonKey(name: 'actual_preview_width')  int? actualPreviewWidth, @JsonKey(name: 'actual_preview_height')  int? actualPreviewHeight, @JsonKey(name: 'sample_url')  String? sampleUrl, @JsonKey(name: 'sample_width')  int? sampleWidth, @JsonKey(name: 'sample_height')  int? sampleHeight, @JsonKey(name: 'sample_file_size')  int? sampleFileSize, @JsonKey(name: 'jpeg_url')  String? jpegUrl, @JsonKey(name: 'jpeg_width')  int? jpegWidth, @JsonKey(name: 'jpeg_height')  int? jpegHeight, @JsonKey(name: 'jpeg_file_size')  int? jpegFileSize, @JsonKey(name: 'rating')  String? rating, @JsonKey(name: 'is_rating_locked')  bool? isRatingLocked, @JsonKey(name: 'has_children')  bool? hasChildren, @JsonKey(name: 'parent_id')  int? parentId, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'is_pending')  bool? isPending, @JsonKey(name: 'width')  int? width, @JsonKey(name: 'height')  int? height, @JsonKey(name: 'is_held')  bool? isHeld, @JsonKey(name: 'frames_pending_string')  String? framesPendingString, @JsonKey(name: 'is_note_locked')  bool? isNoteLocked, @JsonKey(name: 'last_noted_at')  int? lastNotedAt, @JsonKey(name: 'last_commented_at')  int? lastCommentedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.tags,_that.createdAt,_that.updatedAt,_that.creatorId,_that.approverId,_that.author,_that.change,_that.source,_that.score,_that.md5,_that.fileSize,_that.fileExt,_that.fileUrl,_that.isShownInIndex,_that.previewUrl,_that.previewWidth,_that.previewHeight,_that.actualPreviewWidth,_that.actualPreviewHeight,_that.sampleUrl,_that.sampleWidth,_that.sampleHeight,_that.sampleFileSize,_that.jpegUrl,_that.jpegWidth,_that.jpegHeight,_that.jpegFileSize,_that.rating,_that.isRatingLocked,_that.hasChildren,_that.parentId,_that.status,_that.isPending,_that.width,_that.height,_that.isHeld,_that.framesPendingString,_that.isNoteLocked,_that.lastNotedAt,_that.lastCommentedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'tags')  String? tags, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt, @JsonKey(name: 'creator_id')  int? creatorId, @JsonKey(name: 'approver_id')  int? approverId, @JsonKey(name: 'author')  String? author, @JsonKey(name: 'change')  int? change, @JsonKey(name: 'source')  String? source, @JsonKey(name: 'score')  int? score, @JsonKey(name: 'md5')  String? md5, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_ext')  String? fileExt, @JsonKey(name: 'file_url')  String? fileUrl, @JsonKey(name: 'is_shown_in_index')  bool? isShownInIndex, @JsonKey(name: 'preview_url')  String? previewUrl, @JsonKey(name: 'preview_width')  int? previewWidth, @JsonKey(name: 'preview_height')  int? previewHeight, @JsonKey(name: 'actual_preview_width')  int? actualPreviewWidth, @JsonKey(name: 'actual_preview_height')  int? actualPreviewHeight, @JsonKey(name: 'sample_url')  String? sampleUrl, @JsonKey(name: 'sample_width')  int? sampleWidth, @JsonKey(name: 'sample_height')  int? sampleHeight, @JsonKey(name: 'sample_file_size')  int? sampleFileSize, @JsonKey(name: 'jpeg_url')  String? jpegUrl, @JsonKey(name: 'jpeg_width')  int? jpegWidth, @JsonKey(name: 'jpeg_height')  int? jpegHeight, @JsonKey(name: 'jpeg_file_size')  int? jpegFileSize, @JsonKey(name: 'rating')  String? rating, @JsonKey(name: 'is_rating_locked')  bool? isRatingLocked, @JsonKey(name: 'has_children')  bool? hasChildren, @JsonKey(name: 'parent_id')  int? parentId, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'is_pending')  bool? isPending, @JsonKey(name: 'width')  int? width, @JsonKey(name: 'height')  int? height, @JsonKey(name: 'is_held')  bool? isHeld, @JsonKey(name: 'frames_pending_string')  String? framesPendingString, @JsonKey(name: 'is_note_locked')  bool? isNoteLocked, @JsonKey(name: 'last_noted_at')  int? lastNotedAt, @JsonKey(name: 'last_commented_at')  int? lastCommentedAt)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.id,_that.tags,_that.createdAt,_that.updatedAt,_that.creatorId,_that.approverId,_that.author,_that.change,_that.source,_that.score,_that.md5,_that.fileSize,_that.fileExt,_that.fileUrl,_that.isShownInIndex,_that.previewUrl,_that.previewWidth,_that.previewHeight,_that.actualPreviewWidth,_that.actualPreviewHeight,_that.sampleUrl,_that.sampleWidth,_that.sampleHeight,_that.sampleFileSize,_that.jpegUrl,_that.jpegWidth,_that.jpegHeight,_that.jpegFileSize,_that.rating,_that.isRatingLocked,_that.hasChildren,_that.parentId,_that.status,_that.isPending,_that.width,_that.height,_that.isHeld,_that.framesPendingString,_that.isNoteLocked,_that.lastNotedAt,_that.lastCommentedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'tags')  String? tags, @JsonKey(name: 'created_at')  int? createdAt, @JsonKey(name: 'updated_at')  int? updatedAt, @JsonKey(name: 'creator_id')  int? creatorId, @JsonKey(name: 'approver_id')  int? approverId, @JsonKey(name: 'author')  String? author, @JsonKey(name: 'change')  int? change, @JsonKey(name: 'source')  String? source, @JsonKey(name: 'score')  int? score, @JsonKey(name: 'md5')  String? md5, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_ext')  String? fileExt, @JsonKey(name: 'file_url')  String? fileUrl, @JsonKey(name: 'is_shown_in_index')  bool? isShownInIndex, @JsonKey(name: 'preview_url')  String? previewUrl, @JsonKey(name: 'preview_width')  int? previewWidth, @JsonKey(name: 'preview_height')  int? previewHeight, @JsonKey(name: 'actual_preview_width')  int? actualPreviewWidth, @JsonKey(name: 'actual_preview_height')  int? actualPreviewHeight, @JsonKey(name: 'sample_url')  String? sampleUrl, @JsonKey(name: 'sample_width')  int? sampleWidth, @JsonKey(name: 'sample_height')  int? sampleHeight, @JsonKey(name: 'sample_file_size')  int? sampleFileSize, @JsonKey(name: 'jpeg_url')  String? jpegUrl, @JsonKey(name: 'jpeg_width')  int? jpegWidth, @JsonKey(name: 'jpeg_height')  int? jpegHeight, @JsonKey(name: 'jpeg_file_size')  int? jpegFileSize, @JsonKey(name: 'rating')  String? rating, @JsonKey(name: 'is_rating_locked')  bool? isRatingLocked, @JsonKey(name: 'has_children')  bool? hasChildren, @JsonKey(name: 'parent_id')  int? parentId, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'is_pending')  bool? isPending, @JsonKey(name: 'width')  int? width, @JsonKey(name: 'height')  int? height, @JsonKey(name: 'is_held')  bool? isHeld, @JsonKey(name: 'frames_pending_string')  String? framesPendingString, @JsonKey(name: 'is_note_locked')  bool? isNoteLocked, @JsonKey(name: 'last_noted_at')  int? lastNotedAt, @JsonKey(name: 'last_commented_at')  int? lastCommentedAt)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.tags,_that.createdAt,_that.updatedAt,_that.creatorId,_that.approverId,_that.author,_that.change,_that.source,_that.score,_that.md5,_that.fileSize,_that.fileExt,_that.fileUrl,_that.isShownInIndex,_that.previewUrl,_that.previewWidth,_that.previewHeight,_that.actualPreviewWidth,_that.actualPreviewHeight,_that.sampleUrl,_that.sampleWidth,_that.sampleHeight,_that.sampleFileSize,_that.jpegUrl,_that.jpegWidth,_that.jpegHeight,_that.jpegFileSize,_that.rating,_that.isRatingLocked,_that.hasChildren,_that.parentId,_that.status,_that.isPending,_that.width,_that.height,_that.isHeld,_that.framesPendingString,_that.isNoteLocked,_that.lastNotedAt,_that.lastCommentedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
  const _Post({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'tags') this.tags = null, @JsonKey(name: 'created_at') this.createdAt = null, @JsonKey(name: 'updated_at') this.updatedAt = null, @JsonKey(name: 'creator_id') this.creatorId = null, @JsonKey(name: 'approver_id') this.approverId = null, @JsonKey(name: 'author') this.author = null, @JsonKey(name: 'change') this.change = null, @JsonKey(name: 'source') this.source = null, @JsonKey(name: 'score') this.score = null, @JsonKey(name: 'md5') this.md5 = null, @JsonKey(name: 'file_size') this.fileSize = null, @JsonKey(name: 'file_ext') this.fileExt = null, @JsonKey(name: 'file_url') this.fileUrl = null, @JsonKey(name: 'is_shown_in_index') this.isShownInIndex = null, @JsonKey(name: 'preview_url') this.previewUrl = null, @JsonKey(name: 'preview_width') this.previewWidth = null, @JsonKey(name: 'preview_height') this.previewHeight = null, @JsonKey(name: 'actual_preview_width') this.actualPreviewWidth = null, @JsonKey(name: 'actual_preview_height') this.actualPreviewHeight = null, @JsonKey(name: 'sample_url') this.sampleUrl = null, @JsonKey(name: 'sample_width') this.sampleWidth = null, @JsonKey(name: 'sample_height') this.sampleHeight = null, @JsonKey(name: 'sample_file_size') this.sampleFileSize = null, @JsonKey(name: 'jpeg_url') this.jpegUrl = null, @JsonKey(name: 'jpeg_width') this.jpegWidth = null, @JsonKey(name: 'jpeg_height') this.jpegHeight = null, @JsonKey(name: 'jpeg_file_size') this.jpegFileSize = null, @JsonKey(name: 'rating') this.rating = null, @JsonKey(name: 'is_rating_locked') this.isRatingLocked = null, @JsonKey(name: 'has_children') this.hasChildren = null, @JsonKey(name: 'parent_id') this.parentId = null, @JsonKey(name: 'status') this.status = null, @JsonKey(name: 'is_pending') this.isPending = null, @JsonKey(name: 'width') this.width = null, @JsonKey(name: 'height') this.height = null, @JsonKey(name: 'is_held') this.isHeld = null, @JsonKey(name: 'frames_pending_string') this.framesPendingString = null, @JsonKey(name: 'is_note_locked') this.isNoteLocked = null, @JsonKey(name: 'last_noted_at') this.lastNotedAt = null, @JsonKey(name: 'last_commented_at') this.lastCommentedAt = null});
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'tags') final  String? tags;
@override@JsonKey(name: 'created_at') final  int? createdAt;
@override@JsonKey(name: 'updated_at') final  int? updatedAt;
@override@JsonKey(name: 'creator_id') final  int? creatorId;
@override@JsonKey(name: 'approver_id') final  int? approverId;
@override@JsonKey(name: 'author') final  String? author;
@override@JsonKey(name: 'change') final  int? change;
@override@JsonKey(name: 'source') final  String? source;
@override@JsonKey(name: 'score') final  int? score;
@override@JsonKey(name: 'md5') final  String? md5;
@override@JsonKey(name: 'file_size') final  int? fileSize;
@override@JsonKey(name: 'file_ext') final  String? fileExt;
@override@JsonKey(name: 'file_url') final  String? fileUrl;
@override@JsonKey(name: 'is_shown_in_index') final  bool? isShownInIndex;
@override@JsonKey(name: 'preview_url') final  String? previewUrl;
@override@JsonKey(name: 'preview_width') final  int? previewWidth;
@override@JsonKey(name: 'preview_height') final  int? previewHeight;
@override@JsonKey(name: 'actual_preview_width') final  int? actualPreviewWidth;
@override@JsonKey(name: 'actual_preview_height') final  int? actualPreviewHeight;
@override@JsonKey(name: 'sample_url') final  String? sampleUrl;
@override@JsonKey(name: 'sample_width') final  int? sampleWidth;
@override@JsonKey(name: 'sample_height') final  int? sampleHeight;
@override@JsonKey(name: 'sample_file_size') final  int? sampleFileSize;
@override@JsonKey(name: 'jpeg_url') final  String? jpegUrl;
@override@JsonKey(name: 'jpeg_width') final  int? jpegWidth;
@override@JsonKey(name: 'jpeg_height') final  int? jpegHeight;
@override@JsonKey(name: 'jpeg_file_size') final  int? jpegFileSize;
@override@JsonKey(name: 'rating') final  String? rating;
@override@JsonKey(name: 'is_rating_locked') final  bool? isRatingLocked;
@override@JsonKey(name: 'has_children') final  bool? hasChildren;
@override@JsonKey(name: 'parent_id') final  int? parentId;
@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'is_pending') final  bool? isPending;
@override@JsonKey(name: 'width') final  int? width;
@override@JsonKey(name: 'height') final  int? height;
@override@JsonKey(name: 'is_held') final  bool? isHeld;
@override@JsonKey(name: 'frames_pending_string') final  String? framesPendingString;
@override@JsonKey(name: 'is_note_locked') final  bool? isNoteLocked;
@override@JsonKey(name: 'last_noted_at') final  int? lastNotedAt;
@override@JsonKey(name: 'last_commented_at') final  int? lastCommentedAt;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCopyWith<_Post> get copyWith => __$PostCopyWithImpl<_Post>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.id, id) || other.id == id)&&(identical(other.tags, tags) || other.tags == tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.author, author) || other.author == author)&&(identical(other.change, change) || other.change == change)&&(identical(other.source, source) || other.source == source)&&(identical(other.score, score) || other.score == score)&&(identical(other.md5, md5) || other.md5 == md5)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileExt, fileExt) || other.fileExt == fileExt)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.isShownInIndex, isShownInIndex) || other.isShownInIndex == isShownInIndex)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.previewWidth, previewWidth) || other.previewWidth == previewWidth)&&(identical(other.previewHeight, previewHeight) || other.previewHeight == previewHeight)&&(identical(other.actualPreviewWidth, actualPreviewWidth) || other.actualPreviewWidth == actualPreviewWidth)&&(identical(other.actualPreviewHeight, actualPreviewHeight) || other.actualPreviewHeight == actualPreviewHeight)&&(identical(other.sampleUrl, sampleUrl) || other.sampleUrl == sampleUrl)&&(identical(other.sampleWidth, sampleWidth) || other.sampleWidth == sampleWidth)&&(identical(other.sampleHeight, sampleHeight) || other.sampleHeight == sampleHeight)&&(identical(other.sampleFileSize, sampleFileSize) || other.sampleFileSize == sampleFileSize)&&(identical(other.jpegUrl, jpegUrl) || other.jpegUrl == jpegUrl)&&(identical(other.jpegWidth, jpegWidth) || other.jpegWidth == jpegWidth)&&(identical(other.jpegHeight, jpegHeight) || other.jpegHeight == jpegHeight)&&(identical(other.jpegFileSize, jpegFileSize) || other.jpegFileSize == jpegFileSize)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isRatingLocked, isRatingLocked) || other.isRatingLocked == isRatingLocked)&&(identical(other.hasChildren, hasChildren) || other.hasChildren == hasChildren)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.isHeld, isHeld) || other.isHeld == isHeld)&&(identical(other.framesPendingString, framesPendingString) || other.framesPendingString == framesPendingString)&&(identical(other.isNoteLocked, isNoteLocked) || other.isNoteLocked == isNoteLocked)&&(identical(other.lastNotedAt, lastNotedAt) || other.lastNotedAt == lastNotedAt)&&(identical(other.lastCommentedAt, lastCommentedAt) || other.lastCommentedAt == lastCommentedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,tags,createdAt,updatedAt,creatorId,approverId,author,change,source,score,md5,fileSize,fileExt,fileUrl,isShownInIndex,previewUrl,previewWidth,previewHeight,actualPreviewWidth,actualPreviewHeight,sampleUrl,sampleWidth,sampleHeight,sampleFileSize,jpegUrl,jpegWidth,jpegHeight,jpegFileSize,rating,isRatingLocked,hasChildren,parentId,status,isPending,width,height,isHeld,framesPendingString,isNoteLocked,lastNotedAt,lastCommentedAt]);
}

@override
String toString() {
    return 'Post(id: $id, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, creatorId: $creatorId, approverId: $approverId, author: $author, change: $change, source: $source, score: $score, md5: $md5, fileSize: $fileSize, fileExt: $fileExt, fileUrl: $fileUrl, isShownInIndex: $isShownInIndex, previewUrl: $previewUrl, previewWidth: $previewWidth, previewHeight: $previewHeight, actualPreviewWidth: $actualPreviewWidth, actualPreviewHeight: $actualPreviewHeight, sampleUrl: $sampleUrl, sampleWidth: $sampleWidth, sampleHeight: $sampleHeight, sampleFileSize: $sampleFileSize, jpegUrl: $jpegUrl, jpegWidth: $jpegWidth, jpegHeight: $jpegHeight, jpegFileSize: $jpegFileSize, rating: $rating, isRatingLocked: $isRatingLocked, hasChildren: $hasChildren, parentId: $parentId, status: $status, isPending: $isPending, width: $width, height: $height, isHeld: $isHeld, framesPendingString: $framesPendingString, isNoteLocked: $isNoteLocked, lastNotedAt: $lastNotedAt, lastCommentedAt: $lastCommentedAt)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'tags') String? tags,@JsonKey(name: 'created_at') int? createdAt,@JsonKey(name: 'updated_at') int? updatedAt,@JsonKey(name: 'creator_id') int? creatorId,@JsonKey(name: 'approver_id') int? approverId,@JsonKey(name: 'author') String? author,@JsonKey(name: 'change') int? change,@JsonKey(name: 'source') String? source,@JsonKey(name: 'score') int? score,@JsonKey(name: 'md5') String? md5,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'file_ext') String? fileExt,@JsonKey(name: 'file_url') String? fileUrl,@JsonKey(name: 'is_shown_in_index') bool? isShownInIndex,@JsonKey(name: 'preview_url') String? previewUrl,@JsonKey(name: 'preview_width') int? previewWidth,@JsonKey(name: 'preview_height') int? previewHeight,@JsonKey(name: 'actual_preview_width') int? actualPreviewWidth,@JsonKey(name: 'actual_preview_height') int? actualPreviewHeight,@JsonKey(name: 'sample_url') String? sampleUrl,@JsonKey(name: 'sample_width') int? sampleWidth,@JsonKey(name: 'sample_height') int? sampleHeight,@JsonKey(name: 'sample_file_size') int? sampleFileSize,@JsonKey(name: 'jpeg_url') String? jpegUrl,@JsonKey(name: 'jpeg_width') int? jpegWidth,@JsonKey(name: 'jpeg_height') int? jpegHeight,@JsonKey(name: 'jpeg_file_size') int? jpegFileSize,@JsonKey(name: 'rating') String? rating,@JsonKey(name: 'is_rating_locked') bool? isRatingLocked,@JsonKey(name: 'has_children') bool? hasChildren,@JsonKey(name: 'parent_id') int? parentId,@JsonKey(name: 'status') String? status,@JsonKey(name: 'is_pending') bool? isPending,@JsonKey(name: 'width') int? width,@JsonKey(name: 'height') int? height,@JsonKey(name: 'is_held') bool? isHeld,@JsonKey(name: 'frames_pending_string') String? framesPendingString,@JsonKey(name: 'is_note_locked') bool? isNoteLocked,@JsonKey(name: 'last_noted_at') int? lastNotedAt,@JsonKey(name: 'last_commented_at') int? lastCommentedAt
});




}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tags = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? creatorId = freezed,Object? approverId = freezed,Object? author = freezed,Object? change = freezed,Object? source = freezed,Object? score = freezed,Object? md5 = freezed,Object? fileSize = freezed,Object? fileExt = freezed,Object? fileUrl = freezed,Object? isShownInIndex = freezed,Object? previewUrl = freezed,Object? previewWidth = freezed,Object? previewHeight = freezed,Object? actualPreviewWidth = freezed,Object? actualPreviewHeight = freezed,Object? sampleUrl = freezed,Object? sampleWidth = freezed,Object? sampleHeight = freezed,Object? sampleFileSize = freezed,Object? jpegUrl = freezed,Object? jpegWidth = freezed,Object? jpegHeight = freezed,Object? jpegFileSize = freezed,Object? rating = freezed,Object? isRatingLocked = freezed,Object? hasChildren = freezed,Object? parentId = freezed,Object? status = freezed,Object? isPending = freezed,Object? width = freezed,Object? height = freezed,Object? isHeld = freezed,Object? framesPendingString = freezed,Object? isNoteLocked = freezed,Object? lastNotedAt = freezed,Object? lastCommentedAt = freezed,}) {
  return _then(_Post(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as int?,approverId: freezed == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as int?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,md5: freezed == md5 ? _self.md5 : md5 // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,fileExt: freezed == fileExt ? _self.fileExt : fileExt // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,isShownInIndex: freezed == isShownInIndex ? _self.isShownInIndex : isShownInIndex // ignore: cast_nullable_to_non_nullable
as bool?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,previewWidth: freezed == previewWidth ? _self.previewWidth : previewWidth // ignore: cast_nullable_to_non_nullable
as int?,previewHeight: freezed == previewHeight ? _self.previewHeight : previewHeight // ignore: cast_nullable_to_non_nullable
as int?,actualPreviewWidth: freezed == actualPreviewWidth ? _self.actualPreviewWidth : actualPreviewWidth // ignore: cast_nullable_to_non_nullable
as int?,actualPreviewHeight: freezed == actualPreviewHeight ? _self.actualPreviewHeight : actualPreviewHeight // ignore: cast_nullable_to_non_nullable
as int?,sampleUrl: freezed == sampleUrl ? _self.sampleUrl : sampleUrl // ignore: cast_nullable_to_non_nullable
as String?,sampleWidth: freezed == sampleWidth ? _self.sampleWidth : sampleWidth // ignore: cast_nullable_to_non_nullable
as int?,sampleHeight: freezed == sampleHeight ? _self.sampleHeight : sampleHeight // ignore: cast_nullable_to_non_nullable
as int?,sampleFileSize: freezed == sampleFileSize ? _self.sampleFileSize : sampleFileSize // ignore: cast_nullable_to_non_nullable
as int?,jpegUrl: freezed == jpegUrl ? _self.jpegUrl : jpegUrl // ignore: cast_nullable_to_non_nullable
as String?,jpegWidth: freezed == jpegWidth ? _self.jpegWidth : jpegWidth // ignore: cast_nullable_to_non_nullable
as int?,jpegHeight: freezed == jpegHeight ? _self.jpegHeight : jpegHeight // ignore: cast_nullable_to_non_nullable
as int?,jpegFileSize: freezed == jpegFileSize ? _self.jpegFileSize : jpegFileSize // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String?,isRatingLocked: freezed == isRatingLocked ? _self.isRatingLocked : isRatingLocked // ignore: cast_nullable_to_non_nullable
as bool?,hasChildren: freezed == hasChildren ? _self.hasChildren : hasChildren // ignore: cast_nullable_to_non_nullable
as bool?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isPending: freezed == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,isHeld: freezed == isHeld ? _self.isHeld : isHeld // ignore: cast_nullable_to_non_nullable
as bool?,framesPendingString: freezed == framesPendingString ? _self.framesPendingString : framesPendingString // ignore: cast_nullable_to_non_nullable
as String?,isNoteLocked: freezed == isNoteLocked ? _self.isNoteLocked : isNoteLocked // ignore: cast_nullable_to_non_nullable
as bool?,lastNotedAt: freezed == lastNotedAt ? _self.lastNotedAt : lastNotedAt // ignore: cast_nullable_to_non_nullable
as int?,lastCommentedAt: freezed == lastCommentedAt ? _self.lastCommentedAt : lastCommentedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
