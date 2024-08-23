import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/sources/tale_source.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';
import 'package:storyv2/layers/domain/repositories/tale_repository.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/search_tales.dart';

class TaleRepositoryImpl implements TaleRepository {
  final TaleSource taleSource;

  const TaleRepositoryImpl({
    required this.taleSource,
  });

  @override
  Future<Either<Failure, List<TaleEntity>>> getPopularTales() async {
    final response = await taleSource.getPopularTales(NoParams());
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((tale) => tale.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<TaleEntity>>> getNearMeTales(NearMeTalesParams params) async {
    final response = await taleSource.getNearMeTales(params);
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((tale) => tale.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<TaleEntity>>> searchTales(SearchTalesParams params) async {
    final response = await taleSource.searchTales(params);
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((tale) => tale.toEntity()).toList());
    });
  }
}
