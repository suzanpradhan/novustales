import 'package:dartz/dartz.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/api/api_paths.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/models/story_response.dart';

abstract class StorySource {
  Future<Either<Failure, List<StoryResponse>>> getForMeStory(NoParams params);
}

class StorySourceImpl implements StorySource {
  final ApiClient _apiClient;

  StorySourceImpl(this._apiClient);
  @override
  Future<Either<Failure, List<StoryResponse>>> getForMeStory(
      NoParams params) async {
    final response = await _apiClient.getRequest(
      ApiPaths.foryoufeedUrl,
      converter: (response) => (response["results"] as List)
          .map((story) => StoryResponse.fromJson(story))
          .toList(),
    );
    return response;
  }
}
