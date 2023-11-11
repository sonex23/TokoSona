import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toko_sona/core/networking/result.dart';
import 'package:toko_sona/feature/home/home_repository_contract.dart';
import 'package:toko_sona/feature/home/product/product_viewparam.dart';

part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRepositoryContract homeRepository;
  ProductCubit(this.homeRepository) : super(const ProductState.initial());

  void getAllProduct() async {
    emit(const ProductState.loading());
    try {
      Result productList = await homeRepository.getAllProducts();
      if (productList is ResponseSuccess) {
        emit(ProductState.loaded(productList.data));
      } else if (productList is ResponseError) {
        emit(ProductState.error(productList.error ?? "Error"));
      }
    } catch (error) {
      emit(ProductState.error(error.toString()));
    }
  }
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _InitialState;
  const factory ProductState.loading() = _LoadingState;
  const factory ProductState.loaded(List<ProductViewparam> productList) = _LoadedState;
  const factory ProductState.error(String error) = _ErrorState;
}

extension ProductStateExtension on ProductState {
  bool get isLoadingState => this is _LoadingState;
  bool get isInitialState => this is _InitialState;
  bool get isErrorState => this is _ErrorState;
  bool get isLoadedState => this is _LoadedState;
  String? get errorMessage => mapOrNull(error: (value) => value.error);
  List<ProductViewparam>? get listProduct => mapOrNull(loaded: (value) => value.productList);
}
