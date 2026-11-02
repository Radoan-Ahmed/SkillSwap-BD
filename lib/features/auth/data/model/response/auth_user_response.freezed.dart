// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserResponse {

 String get id; String get email; String? get fullName;
/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserResponseCopyWith<AuthUserResponse> get copyWith => _$AuthUserResponseCopyWithImpl<AuthUserResponse>(this as AuthUserResponse, _$identity);

  /// Serializes this AuthUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName);

@override
String toString() {
  return 'AuthUserResponse(id: $id, email: $email, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $AuthUserResponseCopyWith<$Res>  {
  factory $AuthUserResponseCopyWith(AuthUserResponse value, $Res Function(AuthUserResponse) _then) = _$AuthUserResponseCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? fullName
});




}
/// @nodoc
class _$AuthUserResponseCopyWithImpl<$Res>
    implements $AuthUserResponseCopyWith<$Res> {
  _$AuthUserResponseCopyWithImpl(this._self, this._then);

  final AuthUserResponse _self;
  final $Res Function(AuthUserResponse) _then;

/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserResponse].
extension AuthUserResponsePatterns on AuthUserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String? fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
return $default(_that.id,_that.email,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String? fullName)  $default,) {final _that = this;
switch (_that) {
case _AuthUserResponse():
return $default(_that.id,_that.email,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String? fullName)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserResponse() when $default != null:
return $default(_that.id,_that.email,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserResponse implements AuthUserResponse {
  const _AuthUserResponse({required this.id, required this.email, this.fullName});
  factory _AuthUserResponse.fromJson(Map<String, dynamic> json) => _$AuthUserResponseFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? fullName;

/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserResponseCopyWith<_AuthUserResponse> get copyWith => __$AuthUserResponseCopyWithImpl<_AuthUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName);

@override
String toString() {
  return 'AuthUserResponse(id: $id, email: $email, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$AuthUserResponseCopyWith<$Res> implements $AuthUserResponseCopyWith<$Res> {
  factory _$AuthUserResponseCopyWith(_AuthUserResponse value, $Res Function(_AuthUserResponse) _then) = __$AuthUserResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? fullName
});




}
/// @nodoc
class __$AuthUserResponseCopyWithImpl<$Res>
    implements _$AuthUserResponseCopyWith<$Res> {
  __$AuthUserResponseCopyWithImpl(this._self, this._then);

  final _AuthUserResponse _self;
  final $Res Function(_AuthUserResponse) _then;

/// Create a copy of AuthUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = freezed,}) {
  return _then(_AuthUserResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
