// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscoveryFilterRequest {

 String? get searchQuery; String? get currentUserId; String? get skillOffered; String? get skillLearned;
/// Create a copy of DiscoveryFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoveryFilterRequestCopyWith<DiscoveryFilterRequest> get copyWith => _$DiscoveryFilterRequestCopyWithImpl<DiscoveryFilterRequest>(this as DiscoveryFilterRequest, _$identity);

  /// Serializes this DiscoveryFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryFilterRequest&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.skillOffered, skillOffered) || other.skillOffered == skillOffered)&&(identical(other.skillLearned, skillLearned) || other.skillLearned == skillLearned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchQuery,currentUserId,skillOffered,skillLearned);

@override
String toString() {
  return 'DiscoveryFilterRequest(searchQuery: $searchQuery, currentUserId: $currentUserId, skillOffered: $skillOffered, skillLearned: $skillLearned)';
}


}

/// @nodoc
abstract mixin class $DiscoveryFilterRequestCopyWith<$Res>  {
  factory $DiscoveryFilterRequestCopyWith(DiscoveryFilterRequest value, $Res Function(DiscoveryFilterRequest) _then) = _$DiscoveryFilterRequestCopyWithImpl;
@useResult
$Res call({
 String? searchQuery, String? currentUserId, String? skillOffered, String? skillLearned
});




}
/// @nodoc
class _$DiscoveryFilterRequestCopyWithImpl<$Res>
    implements $DiscoveryFilterRequestCopyWith<$Res> {
  _$DiscoveryFilterRequestCopyWithImpl(this._self, this._then);

  final DiscoveryFilterRequest _self;
  final $Res Function(DiscoveryFilterRequest) _then;

/// Create a copy of DiscoveryFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = freezed,Object? currentUserId = freezed,Object? skillOffered = freezed,Object? skillLearned = freezed,}) {
  return _then(_self.copyWith(
searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String?,skillOffered: freezed == skillOffered ? _self.skillOffered : skillOffered // ignore: cast_nullable_to_non_nullable
as String?,skillLearned: freezed == skillLearned ? _self.skillLearned : skillLearned // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscoveryFilterRequest].
extension DiscoveryFilterRequestPatterns on DiscoveryFilterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoveryFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoveryFilterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoveryFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _DiscoveryFilterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoveryFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoveryFilterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? searchQuery,  String? currentUserId,  String? skillOffered,  String? skillLearned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoveryFilterRequest() when $default != null:
return $default(_that.searchQuery,_that.currentUserId,_that.skillOffered,_that.skillLearned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? searchQuery,  String? currentUserId,  String? skillOffered,  String? skillLearned)  $default,) {final _that = this;
switch (_that) {
case _DiscoveryFilterRequest():
return $default(_that.searchQuery,_that.currentUserId,_that.skillOffered,_that.skillLearned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? searchQuery,  String? currentUserId,  String? skillOffered,  String? skillLearned)?  $default,) {final _that = this;
switch (_that) {
case _DiscoveryFilterRequest() when $default != null:
return $default(_that.searchQuery,_that.currentUserId,_that.skillOffered,_that.skillLearned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscoveryFilterRequest implements DiscoveryFilterRequest {
  const _DiscoveryFilterRequest({this.searchQuery, this.currentUserId, this.skillOffered, this.skillLearned});
  factory _DiscoveryFilterRequest.fromJson(Map<String, dynamic> json) => _$DiscoveryFilterRequestFromJson(json);

@override final  String? searchQuery;
@override final  String? currentUserId;
@override final  String? skillOffered;
@override final  String? skillLearned;

/// Create a copy of DiscoveryFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveryFilterRequestCopyWith<_DiscoveryFilterRequest> get copyWith => __$DiscoveryFilterRequestCopyWithImpl<_DiscoveryFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscoveryFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveryFilterRequest&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.skillOffered, skillOffered) || other.skillOffered == skillOffered)&&(identical(other.skillLearned, skillLearned) || other.skillLearned == skillLearned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchQuery,currentUserId,skillOffered,skillLearned);

@override
String toString() {
  return 'DiscoveryFilterRequest(searchQuery: $searchQuery, currentUserId: $currentUserId, skillOffered: $skillOffered, skillLearned: $skillLearned)';
}


}

/// @nodoc
abstract mixin class _$DiscoveryFilterRequestCopyWith<$Res> implements $DiscoveryFilterRequestCopyWith<$Res> {
  factory _$DiscoveryFilterRequestCopyWith(_DiscoveryFilterRequest value, $Res Function(_DiscoveryFilterRequest) _then) = __$DiscoveryFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 String? searchQuery, String? currentUserId, String? skillOffered, String? skillLearned
});




}
/// @nodoc
class __$DiscoveryFilterRequestCopyWithImpl<$Res>
    implements _$DiscoveryFilterRequestCopyWith<$Res> {
  __$DiscoveryFilterRequestCopyWithImpl(this._self, this._then);

  final _DiscoveryFilterRequest _self;
  final $Res Function(_DiscoveryFilterRequest) _then;

/// Create a copy of DiscoveryFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = freezed,Object? currentUserId = freezed,Object? skillOffered = freezed,Object? skillLearned = freezed,}) {
  return _then(_DiscoveryFilterRequest(
searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String?,skillOffered: freezed == skillOffered ? _self.skillOffered : skillOffered // ignore: cast_nullable_to_non_nullable
as String?,skillLearned: freezed == skillLearned ? _self.skillLearned : skillLearned // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
