import 'package:flutter/material.dart';
import 'package:toko_sona/feature/home/category/category_viewparam.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/image_constant.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(ImageConstant.categoryBackground),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Center(
            child: Text(
              category,
              style: CustomTextStyle.heading1TextStyle.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
