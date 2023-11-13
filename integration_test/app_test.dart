import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:toko_sona/core/service/hive_client.dart';
import 'package:toko_sona/core/service/service_locator.dart';
import 'package:toko_sona/main.dart';
import 'package:toko_sona/misc/utils/string_constant.dart';
import 'package:toko_sona/widget/category_card.dart';
import 'package:toko_sona/widget/product_list_component.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setUpServices();
    await app<HiveClient>().setupHive();
  });
  group('end-to-end test', () {
    testWidgets('tap on Category Card, show Product Page', (tester) async {
      await tester.pumpWidget(const TokoSonaApp());
      await tester.pumpAndSettle();

      expect(find.byType(CategoryCard), findsWidgets);

      final categoryCard = find.byType(CategoryCard);

      await tester.tap(categoryCard.first);

      await tester.pumpAndSettle();

      expect(find.text(StringConstant.productPage), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('tap on Product Card, show Detail Page', (tester) async {
      await tester.pumpWidget(const TokoSonaApp());
      await tester.pumpAndSettle();

      expect(find.byType(ProductListComponent), findsWidgets);

      final productCard = find.byType(ProductListComponent);

      await tester.tap(productCard.first);

      await tester.pumpAndSettle();

      expect(find.text(StringConstant.detailPage), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('fill text in Search Bar, show Product Page based on search', (tester) async {
      await tester.pumpWidget(const TokoSonaApp());
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);

      final searchBar = find.byType(TextField);

      await tester.tap(searchBar);

      await tester.enterText(searchBar, 'Men');

      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pumpAndSettle();

      expect(find.textContaining('Men'), findsWidgets);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('tap on Cart icon, show Error because list empty', (tester) async {
      await tester.pumpWidget(const TokoSonaApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.shopping_cart_rounded), findsOneWidget);

      final cartButton = find.byIcon(Icons.shopping_cart_rounded);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      expect(find.text(StringConstant.dontHaveProduct), findsOneWidget);
    });

    testWidgets('add two product to cart, show Snackbar', (tester) async {
      await tester.pumpWidget(const TokoSonaApp());
      await tester.pumpAndSettle();

      expect(find.byType(ProductListComponent), findsWidgets);

      final productCard = find.byType(ProductListComponent);

      await tester.tap(productCard.first);

      await tester.pumpAndSettle();

      final listFinder = find.byType(Scrollable);
      var addToCartButton = find.text(StringConstant.addToCart);

      await tester.scrollUntilVisible(
        addToCartButton,
        500.0,
        scrollable: listFinder,
      );
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(find.text(StringConstant.addedToCart), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      await tester.tap(productCard.at(1));
      await tester.pumpAndSettle();

      addToCartButton = find.text(StringConstant.addToCart);

      await tester.scrollUntilVisible(
        addToCartButton,
        500.0,
        scrollable: listFinder,
      );
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(find.text(StringConstant.addedToCart), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('checkout product from Cart, show snackbar Success', (tester) async {
      await tester.pumpWidget(const TokoSonaApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.shopping_cart_rounded), findsOneWidget);

      final cartButton = find.byIcon(Icons.shopping_cart_rounded);

      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      expect(find.text(StringConstant.cartPage), findsOneWidget);

      final buttonCheckout = find.byType(ElevatedButton);
      expect(buttonCheckout, findsOneWidget);

      await tester.tap(buttonCheckout);
      await tester.pumpAndSettle();

      expect(find.text(StringConstant.checkoutSuccess), findsOneWidget);
    });
  });
}
