import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';

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
          'Detail Page',
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
                    product.rating.rate.toString(),
                    style: CustomTextStyle.body1TextStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Description :',
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
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
