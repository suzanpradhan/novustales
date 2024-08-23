import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';

import '../../entities/tale_entity.dart';
import '../../repositories/tale_repository.dart';

class GetPopularTales implements UseCase<Either<Failure, List<TaleEntity>>, NoParams> {
  final TaleRepository taleRepository;

  const GetPopularTales(this.taleRepository);

  @override
  Future<Either<Failure, List<TaleEntity>>> call(NoParams noParams) async {
    return await taleRepository.getPopularTales();
  }
}
