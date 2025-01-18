import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';

import '../../entities/pagination_entity.dart';

class GetMyStories
    implements
        UseCase<Either<Failure, PaginationEntity<StoryEntity>>, NoParams> {
  final StoryRepository storyRepository;

  const GetMyStories(this.storyRepository);

  @override
  Future<Either<Failure, PaginationEntity<StoryEntity>>> call(
      NoParams noParams) async {
    return await storyRepository.getMyStories(noParams);
  }
}
