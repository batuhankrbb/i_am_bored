// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'activity_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ActivityClientTearOff {
  const _$ActivityClientTearOff();

  ActivityRandom activityRandom() {
    return const ActivityRandom();
  }

  ActivityByType activityByType(String type) {
    return ActivityByType(
      type,
    );
  }
}

/// @nodoc
const $ActivityClient = _$ActivityClientTearOff();

/// @nodoc
mixin _$ActivityClient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() activityRandom,
    required TResult Function(String type) activityByType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? activityRandom,
    TResult Function(String type)? activityByType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityRandom value) activityRandom,
    required TResult Function(ActivityByType value) activityByType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityRandom value)? activityRandom,
    TResult Function(ActivityByType value)? activityByType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityClientCopyWith<$Res> {
  factory $ActivityClientCopyWith(
          ActivityClient value, $Res Function(ActivityClient) then) =
      _$ActivityClientCopyWithImpl<$Res>;
}

/// @nodoc
class _$ActivityClientCopyWithImpl<$Res>
    implements $ActivityClientCopyWith<$Res> {
  _$ActivityClientCopyWithImpl(this._value, this._then);

  final ActivityClient _value;
  // ignore: unused_field
  final $Res Function(ActivityClient) _then;
}

/// @nodoc
abstract class $ActivityRandomCopyWith<$Res> {
  factory $ActivityRandomCopyWith(
          ActivityRandom value, $Res Function(ActivityRandom) then) =
      _$ActivityRandomCopyWithImpl<$Res>;
}

/// @nodoc
class _$ActivityRandomCopyWithImpl<$Res>
    extends _$ActivityClientCopyWithImpl<$Res>
    implements $ActivityRandomCopyWith<$Res> {
  _$ActivityRandomCopyWithImpl(
      ActivityRandom _value, $Res Function(ActivityRandom) _then)
      : super(_value, (v) => _then(v as ActivityRandom));

  @override
  ActivityRandom get _value => super._value as ActivityRandom;
}

/// @nodoc

class _$ActivityRandom extends ActivityRandom {
  const _$ActivityRandom() : super._();

  @override
  String toString() {
    return 'ActivityClient.activityRandom()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ActivityRandom);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() activityRandom,
    required TResult Function(String type) activityByType,
  }) {
    return activityRandom();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? activityRandom,
    TResult Function(String type)? activityByType,
    required TResult orElse(),
  }) {
    if (activityRandom != null) {
      return activityRandom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityRandom value) activityRandom,
    required TResult Function(ActivityByType value) activityByType,
  }) {
    return activityRandom(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityRandom value)? activityRandom,
    TResult Function(ActivityByType value)? activityByType,
    required TResult orElse(),
  }) {
    if (activityRandom != null) {
      return activityRandom(this);
    }
    return orElse();
  }
}

abstract class ActivityRandom extends ActivityClient {
  const factory ActivityRandom() = _$ActivityRandom;
  const ActivityRandom._() : super._();
}

/// @nodoc
abstract class $ActivityByTypeCopyWith<$Res> {
  factory $ActivityByTypeCopyWith(
          ActivityByType value, $Res Function(ActivityByType) then) =
      _$ActivityByTypeCopyWithImpl<$Res>;
  $Res call({String type});
}

/// @nodoc
class _$ActivityByTypeCopyWithImpl<$Res>
    extends _$ActivityClientCopyWithImpl<$Res>
    implements $ActivityByTypeCopyWith<$Res> {
  _$ActivityByTypeCopyWithImpl(
      ActivityByType _value, $Res Function(ActivityByType) _then)
      : super(_value, (v) => _then(v as ActivityByType));

  @override
  ActivityByType get _value => super._value as ActivityByType;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(ActivityByType(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActivityByType extends ActivityByType {
  _$ActivityByType(this.type) : super._();

  @override
  final String type;

  @override
  String toString() {
    return 'ActivityClient.activityByType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityByType &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  $ActivityByTypeCopyWith<ActivityByType> get copyWith =>
      _$ActivityByTypeCopyWithImpl<ActivityByType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() activityRandom,
    required TResult Function(String type) activityByType,
  }) {
    return activityByType(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? activityRandom,
    TResult Function(String type)? activityByType,
    required TResult orElse(),
  }) {
    if (activityByType != null) {
      return activityByType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityRandom value) activityRandom,
    required TResult Function(ActivityByType value) activityByType,
  }) {
    return activityByType(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityRandom value)? activityRandom,
    TResult Function(ActivityByType value)? activityByType,
    required TResult orElse(),
  }) {
    if (activityByType != null) {
      return activityByType(this);
    }
    return orElse();
  }
}

abstract class ActivityByType extends ActivityClient {
  factory ActivityByType(String type) = _$ActivityByType;
  ActivityByType._() : super._();

  String get type => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityByTypeCopyWith<ActivityByType> get copyWith =>
      throw _privateConstructorUsedError;
}
