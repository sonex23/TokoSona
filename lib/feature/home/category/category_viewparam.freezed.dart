// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_viewparam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryViewparam {
  List<String> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryViewparamCopyWith<CategoryViewparam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryViewparamCopyWith<$Res> {
  factory $CategoryViewparamCopyWith(
          CategoryViewparam value, $Res Function(CategoryViewparam) then) =
      _$CategoryViewparamCopyWithImpl<$Res, CategoryViewparam>;
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class _$CategoryViewparamCopyWithImpl<$Res, $Val extends CategoryViewparam>
    implements $CategoryViewparamCopyWith<$Res> {
  _$CategoryViewparamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryViewparamImplCopyWith<$Res>
    implements $CategoryViewparamCopyWith<$Res> {
  factory _$$CategoryViewparamImplCopyWith(_$CategoryViewparamImpl value,
          $Res Function(_$CategoryViewparamImpl) then) =
      __$$CategoryViewparamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class __$$CategoryViewparamImplCopyWithImpl<$Res>
    extends _$CategoryViewparamCopyWithImpl<$Res, _$CategoryViewparamImpl>
    implements _$$CategoryViewparamImplCopyWith<$Res> {
  __$$CategoryViewparamImplCopyWithImpl(_$CategoryViewparamImpl _value,
      $Res Function(_$CategoryViewparamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoryViewparamImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CategoryViewparamImpl implements _CategoryViewparam {
  const _$CategoryViewparamImpl({required final List<String> categories})
      : _categories = categories;

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryViewparam(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryViewparamImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryViewparamImplCopyWith<_$CategoryViewparamImpl> get copyWith =>
      __$$CategoryViewparamImplCopyWithImpl<_$CategoryViewparamImpl>(
          this, _$identity);
}

abstract class _CategoryViewparam implements CategoryViewparam {
  const factory _CategoryViewparam({required final List<String> categories}) =
      _$CategoryViewparamImpl;

  @override
  List<String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryViewparamImplCopyWith<_$CategoryViewparamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
