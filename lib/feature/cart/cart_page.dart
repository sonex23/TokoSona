import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:toko_sona/core/service/hive_client.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/hive_constant.dart';
import 'package:toko_sona/misc/utils/palette.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';
import 'package:toko_sona/widget/cart_component.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.cartPage,
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
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: Hive.box(HiveConstant.cartBox).listenable(),
              builder: (context, box, child) {
                List<ProductViewparam> listProduct = List.from(box.values);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: listProduct.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: index == listProduct.length - 1 ? 50 : 20),
                      child: CartComponent(product: listProduct[index]),
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    app<HiveClient>().deleteAllValueByBox(box: HiveConstant.cartBox).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(StringConstant.checkoutSuccess),
                        duration: Duration(seconds: 1),
                      ));
                      context.pop();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Palette.primaryColor),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      StringConstant.checkoutAllProducts,
                      style: CustomTextStyle.body1TextStyle.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
