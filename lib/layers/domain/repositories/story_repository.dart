import 'package:dartz/dartz.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/category_entity.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../core/error/failures.dart';
import '../entities/pagination_entity.dart';
import '../usecases/feed/get_stories.dart';

abstract class StoryRepository {
  Future<Either<Failure, PaginationEntity<StoryEntity>>> getStories(
      SearchStoryParams params);
  Future<Either<Failure, PaginationEntity<StoryEntity>>> getMyStories(
      NoParams noParams);
  Future<Either<Failure, List<StoryEntity>>> getForMeStory();
  Future<Either<Failure, List<StoryEntity>>> getTrendingStory();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
