import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';
import 'package:toko_sona/widget/product_list_component.dart';

class ProductPage extends StatelessWidget {
  final List<ProductViewparam> listProduct;
  const ProductPage({
    super.key,
    required this.listProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.productPage,
          style: CustomTextStyle.body1TextStyle.copyWith(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listProduct.length,
          itemBuilder: (context, index) {
            return ProductListComponent(
              product: listProduct[index],
            );
          },
        ),
      ),
    );
  }
}
