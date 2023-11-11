import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toko_sona/core/networking/result.dart';
import 'package:toko_sona/feature/home/home_repository_contract.dart';

part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRepositoryContract homeRepository;
  CategoryCubit(this.homeRepository) : super(const CategoryState.initial());

  void getAllCategories() async {
    emit(const CategoryState.loading());
    try {
      Result categoryList = await homeRepository.getAllCategories();
      if (categoryList is ResponseSuccess) {
        emit(CategoryState.loaded(categoryList.data));
      } else if (categoryList is ResponseError) {
        emit(CategoryState.error(categoryList.error ?? "Error"));
      }
    } catch (error) {
      emit(CategoryState.error(error.toString()));
    }
  }
}

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _InitialState;
  const factory CategoryState.loading() = _LoadingState;
  const factory CategoryState.loaded(List<String> categoryList) = _LoadedState;
  const factory CategoryState.error(String error) = _ErrorState;
}

extension CategoryStateExtension on CategoryState {
  bool get isLoadingState => this is _LoadingState;
  bool get isInitialState => this is _InitialState;
  bool get isErrorState => this is _ErrorState;
  bool get isLoadedState => this is _LoadedState;
  String? get errorMessage => mapOrNull(error: (value) => value.error);
  List<String>? get listCategory => mapOrNull(loaded: (value) => value.categoryList);
}
