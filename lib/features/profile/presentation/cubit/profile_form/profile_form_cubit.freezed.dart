// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileFormState {

 String? get userId; String? get fullName; String? get bio; List<String> get skillsOffered; List<String> get skillsLearned; ValidationError? get fullNameError;
/// Create a copy of ProfileFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFormStateCopyWith<ProfileFormState> get copyWith => _$ProfileFormStateCopyWithImpl<ProfileFormState>(this as ProfileFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFormState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.skillsOffered, skillsOffered)&&const DeepCollectionEquality().equals(other.skillsLearned, skillsLearned)&&(identical(other.fullNameError, fullNameError) || other.fullNameError == fullNameError));
}


@override
int get hashCode => Object.hash(runtimeType,userId,fullName,bio,const DeepCollectionEquality().hash(skillsOffered),const DeepCollectionEquality().hash(skillsLearned),fullNameError);

@override
String toString() {
  return 'ProfileFormState(userId: $userId, fullName: $fullName, bio: $bio, skillsOffered: $skillsOffered, skillsLearned: $skillsLearned, fullNameError: $fullNameError)';
}


}

/// @nodoc
abstract mixin class $ProfileFormStateCopyWith<$Res>  {
  factory $ProfileFormStateCopyWith(ProfileFormState value, $Res Function(ProfileFormState) _then) = _$ProfileFormStateCopyWithImpl;
@useResult
$Res call({
 String? userId, String? fullName, String? bio, List<String> skillsOffered, List<String> skillsLearned, ValidationError? fullNameError
});




}
/// @nodoc
class _$ProfileFormStateCopyWithImpl<$Res>
    implements $ProfileFormStateCopyWith<$Res> {
  _$ProfileFormStateCopyWithImpl(this._self, this._then);

  final ProfileFormState _self;
  final $Res Function(ProfileFormState) _then;

/// Create a copy of ProfileFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? fullName = freezed,Object? bio = freezed,Object? skillsOffered = null,Object? skillsLearned = null,Object? fullNameError = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,skillsOffered: null == skillsOffered ? _self.skillsOffered : skillsOffered // ignore: cast_nullable_to_non_nullable
as List<String>,skillsLearned: null == skillsLearned ? _self.skillsLearned : skillsLearned // ignore: cast_nullable_to_non_nullable
as List<String>,fullNameError: freezed == fullNameError ? _self.fullNameError : fullNameError // ignore: cast_nullable_to_non_nullable
as ValidationError?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileFormState].
extension ProfileFormStatePatterns on ProfileFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  String? fullName,  String? bio,  List<String> skillsOffered,  List<String> skillsLearned,  ValidationError? fullNameError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileFormState() when $default != null:
return $default(_that.userId,_that.fullName,_that.bio,_that.skillsOffered,_that.skillsLearned,_that.fullNameError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  String? fullName,  String? bio,  List<String> skillsOffered,  List<String> skillsLearned,  ValidationError? fullNameError)  $default,) {final _that = this;
switch (_that) {
case _ProfileFormState():
return $default(_that.userId,_that.fullName,_that.bio,_that.skillsOffered,_that.skillsLearned,_that.fullNameError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  String? fullName,  String? bio,  List<String> skillsOffered,  List<String> skillsLearned,  ValidationError? fullNameError)?  $default,) {final _that = this;
switch (_that) {
case _ProfileFormState() when $default != null:
return $default(_that.userId,_that.fullName,_that.bio,_that.skillsOffered,_that.skillsLearned,_that.fullNameError);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileFormState implements ProfileFormState {
  const _ProfileFormState({this.userId, this.fullName, this.bio, final  List<String> skillsOffered = const [], final  List<String> skillsLearned = const [], this.fullNameError}): _skillsOffered = skillsOffered,_skillsLearned = skillsLearned;
  

@override final  String? userId;
@override final  String? fullName;
@override final  String? bio;
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

@override final  ValidationError? fullNameError;

/// Create a copy of ProfileFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileFormStateCopyWith<_ProfileFormState> get copyWith => __$ProfileFormStateCopyWithImpl<_ProfileFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileFormState&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._skillsOffered, _skillsOffered)&&const DeepCollectionEquality().equals(other._skillsLearned, _skillsLearned)&&(identical(other.fullNameError, fullNameError) || other.fullNameError == fullNameError));
}


@override
int get hashCode => Object.hash(runtimeType,userId,fullName,bio,const DeepCollectionEquality().hash(_skillsOffered),const DeepCollectionEquality().hash(_skillsLearned),fullNameError);

@override
String toString() {
  return 'ProfileFormState(userId: $userId, fullName: $fullName, bio: $bio, skillsOffered: $skillsOffered, skillsLearned: $skillsLearned, fullNameError: $fullNameError)';
}


}

/// @nodoc
abstract mixin class _$ProfileFormStateCopyWith<$Res> implements $ProfileFormStateCopyWith<$Res> {
  factory _$ProfileFormStateCopyWith(_ProfileFormState value, $Res Function(_ProfileFormState) _then) = __$ProfileFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? userId, String? fullName, String? bio, List<String> skillsOffered, List<String> skillsLearned, ValidationError? fullNameError
});




}
/// @nodoc
class __$ProfileFormStateCopyWithImpl<$Res>
    implements _$ProfileFormStateCopyWith<$Res> {
  __$ProfileFormStateCopyWithImpl(this._self, this._then);

  final _ProfileFormState _self;
  final $Res Function(_ProfileFormState) _then;

/// Create a copy of ProfileFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? fullName = freezed,Object? bio = freezed,Object? skillsOffered = null,Object? skillsLearned = null,Object? fullNameError = freezed,}) {
  return _then(_ProfileFormState(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,skillsOffered: null == skillsOffered ? _self._skillsOffered : skillsOffered // ignore: cast_nullable_to_non_nullable
as List<String>,skillsLearned: null == skillsLearned ? _self._skillsLearned : skillsLearned // ignore: cast_nullable_to_non_nullable
as List<String>,fullNameError: freezed == fullNameError ? _self.fullNameError : fullNameError // ignore: cast_nullable_to_non_nullable
as ValidationError?,
  ));
}


}

// dart format on
