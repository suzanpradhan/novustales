import 'package:dartz/dartz.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/api/api_paths.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/models/profile_response.dart';

abstract class ProfileSource {
  Future<Either<Failure, ProfileResponse>> getMyProfile(NoParams params);
}

class ProfileSourceImpl implements ProfileSource {
  final ApiClient _apiClient;

  ProfileSourceImpl(this._apiClient);
  @override
  Future<Either<Failure, ProfileResponse>> getMyProfile(NoParams params) async {
    final response = await _apiClient.getRequest(ApiPaths.profileUrl,
        converter: (response) => ProfileResponse.fromJson(response));
    return response;
  }
}
