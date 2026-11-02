// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileInitial value)?  initial,TResult Function( ProfileLoading value)?  loading,TResult Function( ProfileSuccess value)?  success,TResult Function( ProfileUpdating value)?  updating,TResult Function( ProfileUpdateSuccess value)?  updateSuccess,TResult Function( ProfileFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial(_that);case ProfileLoading() when loading != null:
return loading(_that);case ProfileSuccess() when success != null:
return success(_that);case ProfileUpdating() when updating != null:
return updating(_that);case ProfileUpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case ProfileFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileInitial value)  initial,required TResult Function( ProfileLoading value)  loading,required TResult Function( ProfileSuccess value)  success,required TResult Function( ProfileUpdating value)  updating,required TResult Function( ProfileUpdateSuccess value)  updateSuccess,required TResult Function( ProfileFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProfileInitial():
return initial(_that);case ProfileLoading():
return loading(_that);case ProfileSuccess():
return success(_that);case ProfileUpdating():
return updating(_that);case ProfileUpdateSuccess():
return updateSuccess(_that);case ProfileFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileInitial value)?  initial,TResult? Function( ProfileLoading value)?  loading,TResult? Function( ProfileSuccess value)?  success,TResult? Function( ProfileUpdating value)?  updating,TResult? Function( ProfileUpdateSuccess value)?  updateSuccess,TResult? Function( ProfileFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial(_that);case ProfileLoading() when loading != null:
return loading(_that);case ProfileSuccess() when success != null:
return success(_that);case ProfileUpdating() when updating != null:
return updating(_that);case ProfileUpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case ProfileFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProfileResponse profile)?  success,TResult Function()?  updating,TResult Function( ProfileResponse profile)?  updateSuccess,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial();case ProfileLoading() when loading != null:
return loading();case ProfileSuccess() when success != null:
return success(_that.profile);case ProfileUpdating() when updating != null:
return updating();case ProfileUpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.profile);case ProfileFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProfileResponse profile)  success,required TResult Function()  updating,required TResult Function( ProfileResponse profile)  updateSuccess,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ProfileInitial():
return initial();case ProfileLoading():
return loading();case ProfileSuccess():
return success(_that.profile);case ProfileUpdating():
return updating();case ProfileUpdateSuccess():
return updateSuccess(_that.profile);case ProfileFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProfileResponse profile)?  success,TResult? Function()?  updating,TResult? Function( ProfileResponse profile)?  updateSuccess,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial();case ProfileLoading() when loading != null:
return loading();case ProfileSuccess() when success != null:
return success(_that.profile);case ProfileUpdating() when updating != null:
return updating();case ProfileUpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.profile);case ProfileFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ProfileInitial implements ProfileState {
  const ProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class ProfileLoading implements ProfileState {
  const ProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class ProfileSuccess implements ProfileState {
  const ProfileSuccess({required this.profile});
  

 final  ProfileResponse profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSuccessCopyWith<ProfileSuccess> get copyWith => _$ProfileSuccessCopyWithImpl<ProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSuccess&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileState.success(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileSuccessCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileSuccessCopyWith(ProfileSuccess value, $Res Function(ProfileSuccess) _then) = _$ProfileSuccessCopyWithImpl;
@useResult
$Res call({
 ProfileResponse profile
});


$ProfileResponseCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileSuccessCopyWithImpl<$Res>
    implements $ProfileSuccessCopyWith<$Res> {
  _$ProfileSuccessCopyWithImpl(this._self, this._then);

  final ProfileSuccess _self;
  final $Res Function(ProfileSuccess) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(ProfileSuccess(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileResponse,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<$Res> get profile {
  
  return $ProfileResponseCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class ProfileUpdating implements ProfileState {
  const ProfileUpdating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.updating()';
}


}




/// @nodoc


class ProfileUpdateSuccess implements ProfileState {
  const ProfileUpdateSuccess({required this.profile});
  

 final  ProfileResponse profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdateSuccessCopyWith<ProfileUpdateSuccess> get copyWith => _$ProfileUpdateSuccessCopyWithImpl<ProfileUpdateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdateSuccess&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileState.updateSuccess(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileUpdateSuccessCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileUpdateSuccessCopyWith(ProfileUpdateSuccess value, $Res Function(ProfileUpdateSuccess) _then) = _$ProfileUpdateSuccessCopyWithImpl;
@useResult
$Res call({
 ProfileResponse profile
});


$ProfileResponseCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileUpdateSuccessCopyWithImpl<$Res>
    implements $ProfileUpdateSuccessCopyWith<$Res> {
  _$ProfileUpdateSuccessCopyWithImpl(this._self, this._then);

  final ProfileUpdateSuccess _self;
  final $Res Function(ProfileUpdateSuccess) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(ProfileUpdateSuccess(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileResponse,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<$Res> get profile {
  
  return $ProfileResponseCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class ProfileFailure implements ProfileState {
  const ProfileFailure({required this.failure});
  

 final  Failure failure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFailureCopyWith<ProfileFailure> get copyWith => _$ProfileFailureCopyWithImpl<ProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProfileState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProfileFailureCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileFailureCopyWith(ProfileFailure value, $Res Function(ProfileFailure) _then) = _$ProfileFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ProfileFailureCopyWithImpl<$Res>
    implements $ProfileFailureCopyWith<$Res> {
  _$ProfileFailureCopyWithImpl(this._self, this._then);

  final ProfileFailure _self;
  final $Res Function(ProfileFailure) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ProfileFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
