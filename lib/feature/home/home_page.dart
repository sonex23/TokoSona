import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:toko_sona/core/service/hive_client.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/feature/home/category/category_cubit.dart';
import 'package:toko_sona/feature/home/home_repository.dart';
import 'package:toko_sona/feature/home/product/product_cubit.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/palette.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';
import 'package:toko_sona/widget/category_card.dart';
import 'package:toko_sona/widget/product_list_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => ProductCubit(
          app<HomeRepository>(),
        ),
      ),
      BlocProvider(
        create: (context) => CategoryCubit(
          app<HomeRepository>(),
        ),
      ),
    ], child: const HomePageView());
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Logger logger = Logger();
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getAllProducts();
    context.read<CategoryCubit>().getAllCategories();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConstant.category,
                style: CustomTextStyle.body1TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state.isLoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: state.listCategory!.map((category) => CategoryCard(category: category)).toList()),
                    );
                  } else if (state.isLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.primaryColor,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Error',
                        style: CustomTextStyle.body1TextStyle,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                StringConstant.products,
                style: CustomTextStyle.body1TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state.isLoadedState) {
                    HiveClient hiveClient = HiveClient();
                    hiveClient.getByKeyAndBox(key: 'products', box: 'product_box').then((value) => logger.d(value));
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.listProduct?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductListComponent(
                          product: state.listProduct![index],
                        );
                      },
                    );
                  } else if (state.isLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.primaryColor,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Error',
                        style: CustomTextStyle.body1TextStyle,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
