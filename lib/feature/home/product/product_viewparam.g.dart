// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_viewparam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductViewparamImpl _$$ProductViewparamImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductViewparamImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductViewparamImplToJson(
        _$ProductViewparamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
