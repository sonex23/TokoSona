import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:toko_sona/feature/home/product/product_entity.dart';

part 'product_viewparam.freezed.dart';
part 'product_viewparam.g.dart';

@freezed
class ProductViewparam extends HiveObject with _$ProductViewparam {
  ProductViewparam._();
  @HiveType(typeId: 0, adapterName: 'ProductAdapter')
  factory ProductViewparam({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required double price,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required String image,
    @HiveField(6) required double rating,
  }) = _ProductViewparam;

  factory ProductViewparam.fromJson(Map<String, dynamic> json) => _$ProductViewparamFromJson(json);

  factory ProductViewparam.fromEntity(ProductEntity entity) => ProductViewparam(
        id: entity.id ?? 0,
        title: entity.title ?? '',
        price: entity.price ?? 0,
        description: entity.description ?? '',
        category: entity.category ?? '',
        image: entity.image ?? '',
        rating: entity.rating?.rate ?? 0,
      );
}
