// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscoveryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryState()';
}


}

/// @nodoc
class $DiscoveryStateCopyWith<$Res>  {
$DiscoveryStateCopyWith(DiscoveryState _, $Res Function(DiscoveryState) __);
}


/// Adds pattern-matching-related methods to [DiscoveryState].
extension DiscoveryStatePatterns on DiscoveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiscoveryInitial value)?  initial,TResult Function( DiscoveryLoading value)?  loading,TResult Function( DiscoverySuccess value)?  success,TResult Function( DiscoveryFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiscoveryInitial() when initial != null:
return initial(_that);case DiscoveryLoading() when loading != null:
return loading(_that);case DiscoverySuccess() when success != null:
return success(_that);case DiscoveryFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiscoveryInitial value)  initial,required TResult Function( DiscoveryLoading value)  loading,required TResult Function( DiscoverySuccess value)  success,required TResult Function( DiscoveryFailure value)  failure,}){
final _that = this;
switch (_that) {
case DiscoveryInitial():
return initial(_that);case DiscoveryLoading():
return loading(_that);case DiscoverySuccess():
return success(_that);case DiscoveryFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiscoveryInitial value)?  initial,TResult? Function( DiscoveryLoading value)?  loading,TResult? Function( DiscoverySuccess value)?  success,TResult? Function( DiscoveryFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DiscoveryInitial() when initial != null:
return initial(_that);case DiscoveryLoading() when loading != null:
return loading(_that);case DiscoverySuccess() when success != null:
return success(_that);case DiscoveryFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<UserItemResponse> users)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiscoveryInitial() when initial != null:
return initial();case DiscoveryLoading() when loading != null:
return loading();case DiscoverySuccess() when success != null:
return success(_that.users);case DiscoveryFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<UserItemResponse> users)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case DiscoveryInitial():
return initial();case DiscoveryLoading():
return loading();case DiscoverySuccess():
return success(_that.users);case DiscoveryFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<UserItemResponse> users)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case DiscoveryInitial() when initial != null:
return initial();case DiscoveryLoading() when loading != null:
return loading();case DiscoverySuccess() when success != null:
return success(_that.users);case DiscoveryFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class DiscoveryInitial implements DiscoveryState {
  const DiscoveryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryState.initial()';
}


}




/// @nodoc


class DiscoveryLoading implements DiscoveryState {
  const DiscoveryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryState.loading()';
}


}




/// @nodoc


class DiscoverySuccess implements DiscoveryState {
  const DiscoverySuccess({required final  List<UserItemResponse> users}): _users = users;
  

 final  List<UserItemResponse> _users;
 List<UserItemResponse> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoverySuccessCopyWith<DiscoverySuccess> get copyWith => _$DiscoverySuccessCopyWithImpl<DiscoverySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoverySuccess&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'DiscoveryState.success(users: $users)';
}


}

/// @nodoc
abstract mixin class $DiscoverySuccessCopyWith<$Res> implements $DiscoveryStateCopyWith<$Res> {
  factory $DiscoverySuccessCopyWith(DiscoverySuccess value, $Res Function(DiscoverySuccess) _then) = _$DiscoverySuccessCopyWithImpl;
@useResult
$Res call({
 List<UserItemResponse> users
});




}
/// @nodoc
class _$DiscoverySuccessCopyWithImpl<$Res>
    implements $DiscoverySuccessCopyWith<$Res> {
  _$DiscoverySuccessCopyWithImpl(this._self, this._then);

  final DiscoverySuccess _self;
  final $Res Function(DiscoverySuccess) _then;

/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(DiscoverySuccess(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserItemResponse>,
  ));
}


}

/// @nodoc


class DiscoveryFailure implements DiscoveryState {
  const DiscoveryFailure({required this.failure});
  

 final  Failure failure;

/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoveryFailureCopyWith<DiscoveryFailure> get copyWith => _$DiscoveryFailureCopyWithImpl<DiscoveryFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DiscoveryState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DiscoveryFailureCopyWith<$Res> implements $DiscoveryStateCopyWith<$Res> {
  factory $DiscoveryFailureCopyWith(DiscoveryFailure value, $Res Function(DiscoveryFailure) _then) = _$DiscoveryFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$DiscoveryFailureCopyWithImpl<$Res>
    implements $DiscoveryFailureCopyWith<$Res> {
  _$DiscoveryFailureCopyWithImpl(this._self, this._then);

  final DiscoveryFailure _self;
  final $Res Function(DiscoveryFailure) _then;

/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DiscoveryFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
