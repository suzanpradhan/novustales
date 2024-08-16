import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';

class GetForMeStory
    implements UseCase<Either<Failure, List<StoryEntity>>, NoParams> {
  final StoryRepository storyRepository;

  const GetForMeStory(this.storyRepository);

  @override
  Future<Either<Failure, List<StoryEntity>>> call(NoParams noParams) async {
    return await storyRepository.getForMeStory();
  }
}
