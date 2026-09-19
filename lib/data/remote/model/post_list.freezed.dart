// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostList {

@JsonKey(name: 'posts') List<Post> get posts;
/// Create a copy of PostList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListCopyWith<PostList> get copyWith => _$PostListCopyWithImpl<PostList>(this as PostList, _$identity);

  /// Serializes this PostList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PostList;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostList&&const DeepCollectionEquality().equals(other.posts, _this.posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PostList;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.posts));
}

@override
String toString() {
  final _this = this as PostList;
  return 'PostList(posts: ${_this.posts})';
}


}

/// @nodoc
abstract mixin class $PostListCopyWith<$Res>  {
  factory $PostListCopyWith(PostList value, $Res Function(PostList) _then) = _$PostListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'posts') List<Post> posts
});




}
/// @nodoc
class _$PostListCopyWithImpl<$Res>
    implements $PostListCopyWith<$Res> {
  _$PostListCopyWithImpl(this._self, this._then);

  final PostList _self;
  final $Res Function(PostList) _then;

/// Create a copy of PostList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,}) {
  return _then(PostList(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

}


/// Adds pattern-matching-related methods to [PostList].
extension PostListPatterns on PostList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostList value)  $default,){
final _that = this;
switch (_that) {
case _PostList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostList value)?  $default,){
final _that = this;
switch (_that) {
case _PostList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'posts')  List<Post> posts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostList() when $default != null:
return $default(_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'posts')  List<Post> posts)  $default,) {final _that = this;
switch (_that) {
case _PostList():
return $default(_that.posts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'posts')  List<Post> posts)?  $default,) {final _that = this;
switch (_that) {
case _PostList() when $default != null:
return $default(_that.posts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostList implements PostList {
  const _PostList({@JsonKey(name: 'posts') required  List<Post> posts}): _posts = posts;
  factory _PostList.fromJson(Map<String, dynamic> json) => _$PostListFromJson(json);

 final  List<Post> _posts;
@override@JsonKey(name: 'posts') List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of PostList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListCopyWith<_PostList> get copyWith => __$PostListCopyWithImpl<_PostList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostListToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostList&&const DeepCollectionEquality().equals(other.posts, _posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts));
}

@override
String toString() {
    return 'PostList(posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$PostListCopyWith<$Res> implements $PostListCopyWith<$Res> {
  factory _$PostListCopyWith(_PostList value, $Res Function(_PostList) _then) = __$PostListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'posts') List<Post> posts
});




}
/// @nodoc
class __$PostListCopyWithImpl<$Res>
    implements _$PostListCopyWith<$Res> {
  __$PostListCopyWithImpl(this._self, this._then);

  final _PostList _self;
  final $Res Function(_PostList) _then;

/// Create a copy of PostList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,}) {
  return _then(_PostList(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

// dart format on
