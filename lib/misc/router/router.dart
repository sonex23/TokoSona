import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_sona/feature/cart/cart_page.dart';
import 'package:toko_sona/feature/detail/detail_page.dart';
import 'package:toko_sona/feature/home/home_page.dart';
import 'package:toko_sona/feature/home/product/product_page.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:toko_sona/misc/utils/router_constant.dart';

class MainRouter {
  late final router = GoRouter(
    initialLocation: homeRouteName,
    routes: [
      GoRoute(
        path: homeRouteName,
        name: homeRouteName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: detailRouteName,
        name: detailRouteName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: DetailPage(
            product: state.extra as ProductViewparam,
          ),
        ),
      ),
      GoRoute(
        path: productRouteName,
        name: productRouteName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: ProductPage(
            listProduct: state.extra as List<ProductViewparam>,
          ),
        ),
      ),
      GoRoute(
        path: cartRouteName,
        name: cartRouteName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const CartPage(),
        ),
      ),
    ],
  );
}
