import 'package:flutter/material.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TextField(
            onEditingComplete: () {},
            decoration: const InputDecoration(
              hintText: StringConstant.searchProduct,
              hintStyle: CustomTextStyle.body1TextStyle,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Icon(
                Icons.search_rounded,
              ),
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.shopping_cart_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 14,
          ),
          Icon(
            Icons.person_2_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 14,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            children: [
              Text(
                'Category',
                style: CustomTextStyle.body1TextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
