import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/feature/home/home_repository.dart';
import 'package:toko_sona/feature/home/product/product_cubit.dart';
import 'package:toko_sona/misc/shared/textstyle.dart';
import 'package:toko_sona/misc/utils/image_constant.dart';
import 'package:toko_sona/misc/utils/palette.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';
import 'package:toko_sona/widget/product_list_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(create: (context) => ProductCubit(app<HomeRepository>()))], child: const HomePageView());
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getAllProduct();
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
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
                              'Men',
                              style: CustomTextStyle.heading1TextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
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
                              'Men',
                              style: CustomTextStyle.heading1TextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
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
                              'Men',
                              style: CustomTextStyle.heading1TextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
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
                              'Men',
                              style: CustomTextStyle.heading1TextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
