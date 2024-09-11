import 'package:dartz/dartz.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/api/api_paths.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/models/category_response.dart';
import 'package:storyv2/layers/data/models/story_response.dart';

import '../../domain/usecases/feed/get_stories.dart';
import '../models/paginated_response.dart';

abstract class StorySource {
  Future<Either<Failure, List<StoryResponse>>> getForMeStory(NoParams params);
  Future<Either<Failure, List<StoryResponse>>> getTrendingStory(
      NoParams params);
  Future<Either<Failure, PaginatedResponse<StoryResponse>>> getStories(
      SearchStoryParams params);
  Future<Either<Failure, List<CategoryResponse>>> getCategories(
      NoParams params);
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

  @override
  Future<Either<Failure, List<StoryResponse>>> getTrendingStory(
      NoParams params) async {
    final response = await _apiClient.getRequest(
      ApiPaths.trendingfeedUrl,
      converter: (response) => (response["results"] as List)
          .map((story) => StoryResponse.fromJson(story))
          .toList(),
    );
    return response;
  }

  @override
  Future<Either<Failure, PaginatedResponse<StoryResponse>>> getStories(
      SearchStoryParams params) async {
    final response = await _apiClient.getRequest(
      ApiPaths.storyUrl,
      converter: (response) =>
          PaginatedResponse<StoryResponse>.fromJson(response),
      queryParameters: params.toJson(),
    );
    return response;
  }

  @override
  Future<Either<Failure, List<CategoryResponse>>> getCategories(
      NoParams params) async {
    final response = await _apiClient.getRequest(
      ApiPaths.categoryUrl,
      converter: (response) => (response["results"] as List)
          .map((story) => CategoryResponse.fromJson(story))
          .toList(),
    );
    return response;
  }
}
