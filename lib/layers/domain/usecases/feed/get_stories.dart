import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/domain/repositories/story_repository.dart';

import '../../entities/pagination_entity.dart';

part 'generated/get_stories.freezed.dart';
part 'generated/get_stories.g.dart';

class GetStories
    implements
        UseCase<Either<Failure, PaginationEntity<StoryEntity>>,
            SearchStoryParams> {
  final StoryRepository storyRepository;

  const GetStories(this.storyRepository);

  @override
  Future<Either<Failure, PaginationEntity<StoryEntity>>> call(
      SearchStoryParams params) async {
    return await storyRepository.getStories(params);
  }
}

@freezed
class SearchStoryParams with _$SearchStoryParams {
  const factory SearchStoryParams({
    String? search,
    @JsonKey(name: "category__name__in") List<String>? categoryNameIn,
  }) = _SearchStoryParams;

  factory SearchStoryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchStoryParamsFromJson(json);
}
