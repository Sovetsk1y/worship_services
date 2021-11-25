// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SongListItemTearOff {
  const _$SongListItemTearOff();

  _SongListItem call({required String id, required String title}) {
    return _SongListItem(
      id: id,
      title: title,
    );
  }
}

/// @nodoc
const $SongListItem = _$SongListItemTearOff();

/// @nodoc
mixin _$SongListItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongListItemCopyWith<SongListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongListItemCopyWith<$Res> {
  factory $SongListItemCopyWith(
          SongListItem value, $Res Function(SongListItem) then) =
      _$SongListItemCopyWithImpl<$Res>;
  $Res call({String id, String title});
}

/// @nodoc
class _$SongListItemCopyWithImpl<$Res> implements $SongListItemCopyWith<$Res> {
  _$SongListItemCopyWithImpl(this._value, this._then);

  final SongListItem _value;
  // ignore: unused_field
  final $Res Function(SongListItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SongListItemCopyWith<$Res>
    implements $SongListItemCopyWith<$Res> {
  factory _$SongListItemCopyWith(
          _SongListItem value, $Res Function(_SongListItem) then) =
      __$SongListItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title});
}

/// @nodoc
class __$SongListItemCopyWithImpl<$Res> extends _$SongListItemCopyWithImpl<$Res>
    implements _$SongListItemCopyWith<$Res> {
  __$SongListItemCopyWithImpl(
      _SongListItem _value, $Res Function(_SongListItem) _then)
      : super(_value, (v) => _then(v as _SongListItem));

  @override
  _SongListItem get _value => super._value as _SongListItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_SongListItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SongListItem implements _SongListItem {
  _$_SongListItem({required this.id, required this.title});

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'SongListItem(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  _$SongListItemCopyWith<_SongListItem> get copyWith =>
      __$SongListItemCopyWithImpl<_SongListItem>(this, _$identity);
}

abstract class _SongListItem implements SongListItem {
  factory _SongListItem({required String id, required String title}) =
      _$_SongListItem;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$SongListItemCopyWith<_SongListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
