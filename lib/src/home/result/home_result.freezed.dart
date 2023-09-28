// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeREsult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeResultSuccess<T> value) success,
    required TResult Function(HomeResultError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeResultSuccess<T> value)? success,
    TResult? Function(HomeResultError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeResultSuccess<T> value)? success,
    TResult Function(HomeResultError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeREsultCopyWith<T, $Res> {
  factory $HomeREsultCopyWith(
          HomeREsult<T> value, $Res Function(HomeREsult<T>) then) =
      _$HomeREsultCopyWithImpl<T, $Res, HomeREsult<T>>;
}

/// @nodoc
class _$HomeREsultCopyWithImpl<T, $Res, $Val extends HomeREsult<T>>
    implements $HomeREsultCopyWith<T, $Res> {
  _$HomeREsultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeResultSuccessCopyWith<T, $Res> {
  factory _$$HomeResultSuccessCopyWith(_$HomeResultSuccess<T> value,
          $Res Function(_$HomeResultSuccess<T>) then) =
      __$$HomeResultSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class __$$HomeResultSuccessCopyWithImpl<T, $Res>
    extends _$HomeREsultCopyWithImpl<T, $Res, _$HomeResultSuccess<T>>
    implements _$$HomeResultSuccessCopyWith<T, $Res> {
  __$$HomeResultSuccessCopyWithImpl(_$HomeResultSuccess<T> _value,
      $Res Function(_$HomeResultSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$HomeResultSuccess<T>(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$HomeResultSuccess<T> implements HomeResultSuccess<T> {
  _$HomeResultSuccess(final List<T> data) : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'HomeREsult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeResultSuccess<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeResultSuccessCopyWith<T, _$HomeResultSuccess<T>> get copyWith =>
      __$$HomeResultSuccessCopyWithImpl<T, _$HomeResultSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeResultSuccess<T> value) success,
    required TResult Function(HomeResultError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeResultSuccess<T> value)? success,
    TResult? Function(HomeResultError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeResultSuccess<T> value)? success,
    TResult Function(HomeResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HomeResultSuccess<T> implements HomeREsult<T> {
  factory HomeResultSuccess(final List<T> data) = _$HomeResultSuccess<T>;

  List<T> get data;
  @JsonKey(ignore: true)
  _$$HomeResultSuccessCopyWith<T, _$HomeResultSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeResultErrorCopyWith<T, $Res> {
  factory _$$HomeResultErrorCopyWith(_$HomeResultError<T> value,
          $Res Function(_$HomeResultError<T>) then) =
      __$$HomeResultErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HomeResultErrorCopyWithImpl<T, $Res>
    extends _$HomeREsultCopyWithImpl<T, $Res, _$HomeResultError<T>>
    implements _$$HomeResultErrorCopyWith<T, $Res> {
  __$$HomeResultErrorCopyWithImpl(
      _$HomeResultError<T> _value, $Res Function(_$HomeResultError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$HomeResultError<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeResultError<T> implements HomeResultError<T> {
  _$HomeResultError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeREsult<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeResultError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeResultErrorCopyWith<T, _$HomeResultError<T>> get copyWith =>
      __$$HomeResultErrorCopyWithImpl<T, _$HomeResultError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<T> data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<T> data)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<T> data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeResultSuccess<T> value) success,
    required TResult Function(HomeResultError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeResultSuccess<T> value)? success,
    TResult? Function(HomeResultError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeResultSuccess<T> value)? success,
    TResult Function(HomeResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeResultError<T> implements HomeREsult<T> {
  factory HomeResultError(final String message) = _$HomeResultError<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$HomeResultErrorCopyWith<T, _$HomeResultError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
