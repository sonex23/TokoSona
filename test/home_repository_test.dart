import 'package:flutter_test/flutter_test.dart';
import 'package:toko_sona/core/networking/rest_client.dart';
import 'package:toko_sona/core/networking/result.dart';
import 'package:toko_sona/core/service/hive_client.dart';
import 'package:toko_sona/feature/home/home_repository.dart';
import 'package:toko_sona/feature/home/product/product_entity.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_test.mocks.dart';
import 'response/category_response.dart';
import 'response/product_response.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([RestClient])
@GenerateNiceMocks([MockSpec<HiveClient>()])
void main() {
  late HomeRepository homeRepository;
  final client = MockRestClient();

  setUpAll(() async {
    final hiveClient = MockHiveClient();
    hiveClient.setupHive();
    homeRepository = HomeRepository(restClient: client, hiveClient: hiveClient);
  });

  group('fetch product', () {
    test("When: getAllProducts() - Then: return list of ProductViewParam", () async {
      Result<List<ProductViewparam>>? result;

      bool isError = false;
      when(client.getAllProducts()).thenAnswer(
        (_) async => Future.value(
          ProductResponse.response.map((json) => ProductEntity.fromJson(json)).toList(),
        ),
      );

      try {
        result = await homeRepository.getAllProducts();
      } catch (e) {
        isError = true;
      }

      expect(isError, false);
      expect(result, isA<Result<List<ProductViewparam>>>());
    });

    test("When: getAllProducts() - Then: return error", () async {
      Result<List<ProductViewparam>>? result;

      bool isError = false;
      when(client.getAllProducts()).thenThrow(Error());

      try {
        result = await homeRepository.getAllProducts();
      } catch (e) {
        isError = true;
      }

      expect(isError, true);
      expect(result, null);
    });
  });

  group('fetch category', () {
    test("When: getAllCategories() - Then: return list of String", () async {
      Result<List<String>>? result;

      bool isError = false;
      when(client.getAllCategories()).thenAnswer(
        (_) async => Future.value(
          CategoryResponse.response,
        ),
      );

      try {
        result = await homeRepository.getAllCategories();
      } catch (e) {
        isError = true;
      }

      expect(isError, false);
      expect(result, isA<Result<List<String>>>());
    });

    test("When: getAllCategories() - Then: return error", () async {
      Result<List<String>>? result;

      bool isError = false;
      when(client.getAllCategories()).thenThrow(Error());

      try {
        result = await homeRepository.getAllCategories();
      } catch (e) {
        isError = true;
      }

      expect(isError, true);
      expect(result, null);
    });
  });
}
