// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpFormState {

 String? get fullName; String? get email; String? get password; ValidationError? get fullNameError; ValidationError? get emailError; ValidationError? get passwordError;
/// Create a copy of SignUpFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpFormStateCopyWith<SignUpFormState> get copyWith => _$SignUpFormStateCopyWithImpl<SignUpFormState>(this as SignUpFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpFormState&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullNameError, fullNameError) || other.fullNameError == fullNameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,email,password,fullNameError,emailError,passwordError);

@override
String toString() {
  return 'SignUpFormState(fullName: $fullName, email: $email, password: $password, fullNameError: $fullNameError, emailError: $emailError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class $SignUpFormStateCopyWith<$Res>  {
  factory $SignUpFormStateCopyWith(SignUpFormState value, $Res Function(SignUpFormState) _then) = _$SignUpFormStateCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? email, String? password, ValidationError? fullNameError, ValidationError? emailError, ValidationError? passwordError
});




}
/// @nodoc
class _$SignUpFormStateCopyWithImpl<$Res>
    implements $SignUpFormStateCopyWith<$Res> {
  _$SignUpFormStateCopyWithImpl(this._self, this._then);

  final SignUpFormState _self;
  final $Res Function(SignUpFormState) _then;

/// Create a copy of SignUpFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? email = freezed,Object? password = freezed,Object? fullNameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,fullNameError: freezed == fullNameError ? _self.fullNameError : fullNameError // ignore: cast_nullable_to_non_nullable
as ValidationError?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as ValidationError?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as ValidationError?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpFormState].
extension SignUpFormStatePatterns on SignUpFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpFormState value)  $default,){
final _that = this;
switch (_that) {
case _SignUpFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? email,  String? password,  ValidationError? fullNameError,  ValidationError? emailError,  ValidationError? passwordError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpFormState() when $default != null:
return $default(_that.fullName,_that.email,_that.password,_that.fullNameError,_that.emailError,_that.passwordError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? email,  String? password,  ValidationError? fullNameError,  ValidationError? emailError,  ValidationError? passwordError)  $default,) {final _that = this;
switch (_that) {
case _SignUpFormState():
return $default(_that.fullName,_that.email,_that.password,_that.fullNameError,_that.emailError,_that.passwordError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? email,  String? password,  ValidationError? fullNameError,  ValidationError? emailError,  ValidationError? passwordError)?  $default,) {final _that = this;
switch (_that) {
case _SignUpFormState() when $default != null:
return $default(_that.fullName,_that.email,_that.password,_that.fullNameError,_that.emailError,_that.passwordError);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpFormState implements SignUpFormState {
  const _SignUpFormState({this.fullName, this.email, this.password, this.fullNameError, this.emailError, this.passwordError});
  

@override final  String? fullName;
@override final  String? email;
@override final  String? password;
@override final  ValidationError? fullNameError;
@override final  ValidationError? emailError;
@override final  ValidationError? passwordError;

/// Create a copy of SignUpFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpFormStateCopyWith<_SignUpFormState> get copyWith => __$SignUpFormStateCopyWithImpl<_SignUpFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpFormState&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullNameError, fullNameError) || other.fullNameError == fullNameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,email,password,fullNameError,emailError,passwordError);

@override
String toString() {
  return 'SignUpFormState(fullName: $fullName, email: $email, password: $password, fullNameError: $fullNameError, emailError: $emailError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class _$SignUpFormStateCopyWith<$Res> implements $SignUpFormStateCopyWith<$Res> {
  factory _$SignUpFormStateCopyWith(_SignUpFormState value, $Res Function(_SignUpFormState) _then) = __$SignUpFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? email, String? password, ValidationError? fullNameError, ValidationError? emailError, ValidationError? passwordError
});




}
/// @nodoc
class __$SignUpFormStateCopyWithImpl<$Res>
    implements _$SignUpFormStateCopyWith<$Res> {
  __$SignUpFormStateCopyWithImpl(this._self, this._then);

  final _SignUpFormState _self;
  final $Res Function(_SignUpFormState) _then;

/// Create a copy of SignUpFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? email = freezed,Object? password = freezed,Object? fullNameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,}) {
  return _then(_SignUpFormState(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,fullNameError: freezed == fullNameError ? _self.fullNameError : fullNameError // ignore: cast_nullable_to_non_nullable
as ValidationError?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as ValidationError?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as ValidationError?,
  ));
}


}

// dart format on
