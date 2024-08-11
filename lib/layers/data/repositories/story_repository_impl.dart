import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/sources/story_source.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StorySource storySource;

  const StoryRepositoryImpl({
    required this.storySource,
  });

  @override
  Future<Either<Failure, List<StoryEntity>>> getForMeStory() async {
    final response = await storySource.getForMeStory(NoParams());
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((story) => story.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<StoryEntity>>> getTrendingStory() async {
    final response = await storySource.getTrendingStory(NoParams());
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((story) => story.toEntity()).toList());
    });
  }
}