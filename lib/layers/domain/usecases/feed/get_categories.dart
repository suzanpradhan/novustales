import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';

import '../../entities/category_entity.dart';

class GetCategories
    implements UseCase<Either<Failure, List<CategoryEntity>>, NoParams> {
  final StoryRepository storyRepository;

  const GetCategories(this.storyRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await storyRepository.getCategories();
  }
}
