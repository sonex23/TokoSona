import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toko_sona/feature/home/product/product_entity.dart';

part 'product_viewparam.freezed.dart';

@freezed
class ProductViewparam with _$ProductViewparam {
  const factory ProductViewparam({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required Rating rating,
  }) = _ProductViewparam;

  factory ProductViewparam.fromEntity(ProductEntity entity) => ProductViewparam(
        id: entity.id ?? 0,
        title: entity.title ?? '',
        price: entity.price ?? 0,
        description: entity.description ?? '',
        category: entity.category ?? '',
        image: entity.image ?? '',
        rating: entity.rating ?? const Rating(),
      );
}
