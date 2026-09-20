// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingState()';
}


}

/// @nodoc
class $SettingStateCopyWith<$Res>  {
$SettingStateCopyWith(SettingState _, $Res Function(SettingState) __);
}


/// Adds pattern-matching-related methods to [SettingState].
extension SettingStatePatterns on SettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingInitialState value)?  initial,TResult Function( SettingInitializedState value)?  initialized,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingInitialState() when initial != null:
return initial(_that);case SettingInitializedState() when initialized != null:
return initialized(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingInitialState value)  initial,required TResult Function( SettingInitializedState value)  initialized,}){
final _that = this;
switch (_that) {
case SettingInitialState():
return initial(_that);case SettingInitializedState():
return initialized(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingInitialState value)?  initial,TResult? Function( SettingInitializedState value)?  initialized,}){
final _that = this;
switch (_that) {
case SettingInitialState() when initial != null:
return initial(_that);case SettingInitializedState() when initialized != null:
return initialized(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String appName,  String appVersion)?  initialized,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingInitialState() when initial != null:
return initial();case SettingInitializedState() when initialized != null:
return initialized(_that.appName,_that.appVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String appName,  String appVersion)  initialized,}) {final _that = this;
switch (_that) {
case SettingInitialState():
return initial();case SettingInitializedState():
return initialized(_that.appName,_that.appVersion);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String appName,  String appVersion)?  initialized,}) {final _that = this;
switch (_that) {
case SettingInitialState() when initial != null:
return initial();case SettingInitializedState() when initialized != null:
return initialized(_that.appName,_that.appVersion);case _:
  return null;

}
}

}

/// @nodoc


class SettingInitialState implements SettingState {
  const SettingInitialState();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingState.initial()';
}


}




/// @nodoc


class SettingInitializedState implements SettingState {
  const SettingInitializedState({required this.appName, required this.appVersion});
  

 final  String appName;
 final  String appVersion;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingInitializedStateCopyWith<SettingInitializedState> get copyWith => _$SettingInitializedStateCopyWithImpl<SettingInitializedState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingInitializedState&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}


@override
int get hashCode {
    return Object.hash(runtimeType,appName,appVersion);
}

@override
String toString() {
    return 'SettingState.initialized(appName: $appName, appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class $SettingInitializedStateCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory $SettingInitializedStateCopyWith(SettingInitializedState value, $Res Function(SettingInitializedState) _then) = _$SettingInitializedStateCopyWithImpl;
@useResult
$Res call({
 String appName, String appVersion
});




}
/// @nodoc
class _$SettingInitializedStateCopyWithImpl<$Res>
    implements $SettingInitializedStateCopyWith<$Res> {
  _$SettingInitializedStateCopyWithImpl(this._self, this._then);

  final SettingInitializedState _self;
  final $Res Function(SettingInitializedState) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? appVersion = null,}) {
  return _then(SettingInitializedState(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
