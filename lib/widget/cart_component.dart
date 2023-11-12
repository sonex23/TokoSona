import 'package:flutter/material.dart';
import 'package:toko_sona/core/service/hive_client.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/hive_constant.dart';

class CartComponent extends StatelessWidget {
  const CartComponent({
    super.key,
    required this.product,
  });

  final ProductViewparam product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 4,
              )
            ],
            image: DecorationImage(
              image: NetworkImage(product.image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: CustomTextStyle.body1TextStyle,
              ),
              Text(
                "\$${product.price}",
                style: CustomTextStyle.heading1TextStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            app<HiveClient>().deleteValueByKey(
              key: product.id.toString(),
              box: HiveConstant.cartBox,
            );
          },
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
