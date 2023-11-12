import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_sona/core/service/hive_client.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/hive_constant.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';

class DetailPage extends StatelessWidget {
  final ProductViewparam product;
  const DetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.detailPage,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.network(
                  product.image,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                product.title,
                style: CustomTextStyle.body1TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "\$${product.price}",
                style: CustomTextStyle.heading1TextStyle,
              ),
              const SizedBox(
                height: 10,
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
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                StringConstant.description,
                style: CustomTextStyle.body1TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                style: CustomTextStyle.body2TextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await app<HiveClient>().saveByKeyAndBox(key: product.id.toString(), box: HiveConstant.cartBox, value: product).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(StringConstant.addedToCart),
                      duration: Duration(seconds: 1),
                    ));
                  });
                },
                child: const Text(
                  StringConstant.addToCart,
                  style: CustomTextStyle.body1TextStyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
