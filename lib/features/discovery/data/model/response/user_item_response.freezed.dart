// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserItemResponse {

 String get id; String get fullName; String get bio; List<String> get skillsOffered; List<String> get skillsLearned; String? get avatarUrl; bool get isMutualMatch;
/// Create a copy of UserItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserItemResponseCopyWith<UserItemResponse> get copyWith => _$UserItemResponseCopyWithImpl<UserItemResponse>(this as UserItemResponse, _$identity);

  /// Serializes this UserItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.skillsOffered, skillsOffered)&&const DeepCollectionEquality().equals(other.skillsLearned, skillsLearned)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isMutualMatch, isMutualMatch) || other.isMutualMatch == isMutualMatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,bio,const DeepCollectionEquality().hash(skillsOffered),const DeepCollectionEquality().hash(skillsLearned),avatarUrl,isMutualMatch);

@override
String toString() {
  return 'UserItemResponse(id: $id, fullName: $fullName, bio: $bio, skillsOffered: $skillsOffered, skillsLearned: $skillsLearned, avatarUrl: $avatarUrl, isMutualMatch: $isMutualMatch)';
}


}

/// @nodoc
abstract mixin class $UserItemResponseCopyWith<$Res>  {
  factory $UserItemResponseCopyWith(UserItemResponse value, $Res Function(UserItemResponse) _then) = _$UserItemResponseCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String bio, List<String> skillsOffered, List<String> skillsLearned, String? avatarUrl, bool isMutualMatch
});




}
/// @nodoc
class _$UserItemResponseCopyWithImpl<$Res>
    implements $UserItemResponseCopyWith<$Res> {
  _$UserItemResponseCopyWithImpl(this._self, this._then);

  final UserItemResponse _self;
  final $Res Function(UserItemResponse) _then;

/// Create a copy of UserItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? bio = null,Object? skillsOffered = null,Object? skillsLearned = null,Object? avatarUrl = freezed,Object? isMutualMatch = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,skillsOffered: null == skillsOffered ? _self.skillsOffered : skillsOffered // ignore: cast_nullable_to_non_nullable
as List<String>,skillsLearned: null == skillsLearned ? _self.skillsLearned : skillsLearned // ignore: cast_nullable_to_non_nullable
as List<String>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isMutualMatch: null == isMutualMatch ? _self.isMutualMatch : isMutualMatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserItemResponse].
extension UserItemResponsePatterns on UserItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String bio,  List<String> skillsOffered,  List<String> skillsLearned,  String? avatarUrl,  bool isMutualMatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserItemResponse() when $default != null:
return $default(_that.id,_that.fullName,_that.bio,_that.skillsOffered,_that.skillsLearned,_that.avatarUrl,_that.isMutualMatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String bio,  List<String> skillsOffered,  List<String> skillsLearned,  String? avatarUrl,  bool isMutualMatch)  $default,) {final _that = this;
switch (_that) {
case _UserItemResponse():
return $default(_that.id,_that.fullName,_that.bio,_that.skillsOffered,_that.skillsLearned,_that.avatarUrl,_that.isMutualMatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String bio,  List<String> skillsOffered,  List<String> skillsLearned,  String? avatarUrl,  bool isMutualMatch)?  $default,) {final _that = this;
switch (_that) {
case _UserItemResponse() when $default != null:
return $default(_that.id,_that.fullName,_that.bio,_that.skillsOffered,_that.skillsLearned,_that.avatarUrl,_that.isMutualMatch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserItemResponse implements UserItemResponse {
  const _UserItemResponse({required this.id, this.fullName = '', this.bio = '', final  List<String> skillsOffered = const [], final  List<String> skillsLearned = const [], this.avatarUrl, this.isMutualMatch = false}): _skillsOffered = skillsOffered,_skillsLearned = skillsLearned;
  factory _UserItemResponse.fromJson(Map<String, dynamic> json) => _$UserItemResponseFromJson(json);

@override final  String id;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String bio;
 final  List<String> _skillsOffered;
@override@JsonKey() List<String> get skillsOffered {
  if (_skillsOffered is EqualUnmodifiableListView) return _skillsOffered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skillsOffered);
}

 final  List<String> _skillsLearned;
@override@JsonKey() List<String> get skillsLearned {
  if (_skillsLearned is EqualUnmodifiableListView) return _skillsLearned;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skillsLearned);
}

@override final  String? avatarUrl;
@override@JsonKey() final  bool isMutualMatch;

/// Create a copy of UserItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserItemResponseCopyWith<_UserItemResponse> get copyWith => __$UserItemResponseCopyWithImpl<_UserItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._skillsOffered, _skillsOffered)&&const DeepCollectionEquality().equals(other._skillsLearned, _skillsLearned)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isMutualMatch, isMutualMatch) || other.isMutualMatch == isMutualMatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,bio,const DeepCollectionEquality().hash(_skillsOffered),const DeepCollectionEquality().hash(_skillsLearned),avatarUrl,isMutualMatch);

@override
String toString() {
  return 'UserItemResponse(id: $id, fullName: $fullName, bio: $bio, skillsOffered: $skillsOffered, skillsLearned: $skillsLearned, avatarUrl: $avatarUrl, isMutualMatch: $isMutualMatch)';
}


}

/// @nodoc
abstract mixin class _$UserItemResponseCopyWith<$Res> implements $UserItemResponseCopyWith<$Res> {
  factory _$UserItemResponseCopyWith(_UserItemResponse value, $Res Function(_UserItemResponse) _then) = __$UserItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String bio, List<String> skillsOffered, List<String> skillsLearned, String? avatarUrl, bool isMutualMatch
});




}
/// @nodoc
class __$UserItemResponseCopyWithImpl<$Res>
    implements _$UserItemResponseCopyWith<$Res> {
  __$UserItemResponseCopyWithImpl(this._self, this._then);

  final _UserItemResponse _self;
  final $Res Function(_UserItemResponse) _then;

/// Create a copy of UserItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? bio = null,Object? skillsOffered = null,Object? skillsLearned = null,Object? avatarUrl = freezed,Object? isMutualMatch = null,}) {
  return _then(_UserItemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,skillsOffered: null == skillsOffered ? _self._skillsOffered : skillsOffered // ignore: cast_nullable_to_non_nullable
as List<String>,skillsLearned: null == skillsLearned ? _self._skillsLearned : skillsLearned // ignore: cast_nullable_to_non_nullable
as List<String>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isMutualMatch: null == isMutualMatch ? _self.isMutualMatch : isMutualMatch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
