import 'package:dartz/dartz.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/search_tales.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_paths.dart';
import '../../../core/error/failures.dart';
import '../models/tale_response.dart';

abstract class TaleSource {
  Future<Either<Failure, List<TaleResponse>>> getPopularTales(NoParams params);
  Future<Either<Failure, List<TaleResponse>>> getNearMeTales(NearMeTalesParams params);
  Future<Either<Failure, List<TaleResponse>>> searchTales(SearchTalesParams params);
}

class TaleSourceImpl implements TaleSource {
  final ApiClient _client;

  TaleSourceImpl(this._client);

  @override
  Future<Either<Failure, List<TaleResponse>>> getPopularTales(NoParams params) async {
    final response = await _client.getRequest(
      ApiPaths.talesUrl,
      converter: (response) =>
          (response["results"] as List).map((tale) => TaleResponse.fromJson(tale)).toList(),
    );

    return response;
  }

  @override
  Future<Either<Failure, List<TaleResponse>>> getNearMeTales(NearMeTalesParams params) async {
    final response = await _client.getRequest(
      ApiPaths.talesUrl,
      queryParameters: params.toJson(),
      converter: (response) =>
          (response["results"] as List).map((tale) => TaleResponse.fromJson(tale)).toList(),
    );

    return response;
  }

  @override
  Future<Either<Failure, List<TaleResponse>>> searchTales(SearchTalesParams params) async {
    final response = await _client.getRequest(
      ApiPaths.talesUrl,
      queryParameters: params.toJson(),
      converter: (response) =>
          (response["results"] as List).map((tale) => TaleResponse.fromJson(tale)).toList(),
    );

    return response;
  }
}
