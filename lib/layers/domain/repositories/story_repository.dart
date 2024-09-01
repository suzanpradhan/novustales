import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/entities/category_entity.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../core/error/failures.dart';
import '../usecases/feed/get_stories.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryEntity>>> getStories(
      SearchStoryParams params);
  Future<Either<Failure, List<StoryEntity>>> getForMeStory();
  Future<Either<Failure, List<StoryEntity>>> getTrendingStory();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
