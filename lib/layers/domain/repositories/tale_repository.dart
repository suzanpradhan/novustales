import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../core/error/failures.dart';
import '../usecases/tales/get_near_me_tales.dart';
import '../usecases/tales/search_tales.dart';

abstract class TaleRepository {
  Future<Either<Failure, List<TaleEntity>>> getPopularTales();
  Future<Either<Failure, List<TaleEntity>>> getNearMeTales(NearMeTalesParams params);
  Future<Either<Failure, List<TaleEntity>>> searchTales(SearchTalesParams params);
}
