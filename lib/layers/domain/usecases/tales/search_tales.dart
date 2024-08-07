import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';

import '../../entities/tale_entity.dart';
import '../../repositories/tale_repository.dart';

part 'generated/search_tales.freezed.dart';
part 'generated/search_tales.g.dart';

class SearchTales implements UseCase<Either<Failure, List<TaleEntity>>, SearchTalesParams> {
  final TaleRepository taleRepository;

  const SearchTales(this.taleRepository);

  @override
  Future<Either<Failure, List<TaleEntity>>> call(SearchTalesParams params) async {
    return await taleRepository.searchTales(params);
  }
}

@freezed
class SearchTalesParams with _$SearchTalesParams {
  const factory SearchTalesParams({
    @JsonKey(name: "search") required String searchText,
  }) = _SearchTalesParams;

  factory SearchTalesParams.fromJson(Map<String, dynamic> json) =>
      _$SearchTalesParamsFromJson(json);
}
