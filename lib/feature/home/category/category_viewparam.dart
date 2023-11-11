import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toko_sona/feature/home/category/category_entity.dart';
import 'package:toko_sona/feature/home/product/product_entity.dart';

part 'category_viewparam.freezed.dart';

@freezed
class CategoryViewparam with _$CategoryViewparam {
  const factory CategoryViewparam({
    required List<String> categories,
  }) = _CategoryViewparam;

  factory CategoryViewparam.fromEntity(CategoryEntity entity) => CategoryViewparam(
        categories: entity.categories ?? [],
      );
}
