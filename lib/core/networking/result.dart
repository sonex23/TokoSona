import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result {
  const factory Result.data(T? data) = ResponseSuccess;

  const factory Result.error(String? error) = ResponseError;
}
