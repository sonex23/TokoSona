// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_viewparam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductViewparam _$ProductViewparamFromJson(Map<String, dynamic> json) {
  return _ProductViewparam.fromJson(json);
}

/// @nodoc
mixin _$ProductViewparam {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  double get price => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String get category => throw _privateConstructorUsedError;
  @HiveField(5)
  String get image => throw _privateConstructorUsedError;
  @HiveField(6)
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductViewparamCopyWith<ProductViewparam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductViewparamCopyWith<$Res> {
  factory $ProductViewparamCopyWith(
          ProductViewparam value, $Res Function(ProductViewparam) then) =
      _$ProductViewparamCopyWithImpl<$Res, ProductViewparam>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) double price,
      @HiveField(3) String description,
      @HiveField(4) String category,
      @HiveField(5) String image,
      @HiveField(6) double rating});
}

/// @nodoc
class _$ProductViewparamCopyWithImpl<$Res, $Val extends ProductViewparam>
    implements $ProductViewparamCopyWith<$Res> {
  _$ProductViewparamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductViewparamImplCopyWith<$Res>
    implements $ProductViewparamCopyWith<$Res> {
  factory _$$ProductViewparamImplCopyWith(_$ProductViewparamImpl value,
          $Res Function(_$ProductViewparamImpl) then) =
      __$$ProductViewparamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) double price,
      @HiveField(3) String description,
      @HiveField(4) String category,
      @HiveField(5) String image,
      @HiveField(6) double rating});
}

/// @nodoc
class __$$ProductViewparamImplCopyWithImpl<$Res>
    extends _$ProductViewparamCopyWithImpl<$Res, _$ProductViewparamImpl>
    implements _$$ProductViewparamImplCopyWith<$Res> {
  __$$ProductViewparamImplCopyWithImpl(_$ProductViewparamImpl _value,
      $Res Function(_$ProductViewparamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
  }) {
    return _then(_$ProductViewparamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'ProductAdapter')
class _$ProductViewparamImpl extends _ProductViewparam {
  _$ProductViewparamImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.price,
      @HiveField(3) required this.description,
      @HiveField(4) required this.category,
      @HiveField(5) required this.image,
      @HiveField(6) required this.rating})
      : super._();

  factory _$ProductViewparamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductViewparamImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final double price;
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final String category;
  @override
  @HiveField(5)
  final String image;
  @override
  @HiveField(6)
  final double rating;

  @override
  String toString() {
    return 'ProductViewparam(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductViewparamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, description, category, image, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductViewparamImplCopyWith<_$ProductViewparamImpl> get copyWith =>
      __$$ProductViewparamImplCopyWithImpl<_$ProductViewparamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductViewparamImplToJson(
      this,
    );
  }
}

abstract class _ProductViewparam extends ProductViewparam {
  factory _ProductViewparam(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String title,
      @HiveField(2) required final double price,
      @HiveField(3) required final String description,
      @HiveField(4) required final String category,
      @HiveField(5) required final String image,
      @HiveField(6) required final double rating}) = _$ProductViewparamImpl;
  _ProductViewparam._() : super._();

  factory _ProductViewparam.fromJson(Map<String, dynamic> json) =
      _$ProductViewparamImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  double get price;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  String get category;
  @override
  @HiveField(5)
  String get image;
  @override
  @HiveField(6)
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$ProductViewparamImplCopyWith<_$ProductViewparamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
