import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/router_constant.dart';

class ProductListComponent extends StatelessWidget {
  final ProductViewparam product;
  const ProductListComponent({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(detailRouteName, extra: product);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: CustomTextStyle.body1TextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$${product.price}",
                    style: CustomTextStyle.heading1TextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 230, 0),
                      ),
                      Text(
                        product.rating.toString(),
                        style: CustomTextStyle.body1TextStyle,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
