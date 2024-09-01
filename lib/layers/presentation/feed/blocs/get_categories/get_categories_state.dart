part of 'get_categories_bloc.dart';

@freezed
class GetCategoriesState with _$GetCategoriesState {
  const factory GetCategoriesState.initial() = _Initial;
  const factory GetCategoriesState.loading() = _Loading;
  const factory GetCategoriesState.success(
      {required List<CategoryEntity> categories}) = _Success;
  const factory GetCategoriesState.failed({required String message}) = _Failed;
}
