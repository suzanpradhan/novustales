import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../core/error/failures.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryEntity>>> getForMeStory();
}
