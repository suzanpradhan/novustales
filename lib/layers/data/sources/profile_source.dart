import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/api/api_paths.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/models/profile_response.dart';

import '../../domain/usecases/profile/update_profile.dart';
import '../models/update_profile_response.dart';

abstract class ProfileSource {
  Future<Either<Failure, ProfileResponse>> getMyProfile(NoParams params);
  Future<Either<Failure, UpdateProfileResponse>> updateProfile(
      UpdateProfileParams getPostProfileParams);
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

  @override
  Future<Either<Failure, UpdateProfileResponse>> updateProfile(
      UpdateProfileParams params) async {
    FormData formData = FormData.fromMap(params.toJson());
    if (params.avatar != null && params.avatar!.isNotEmpty) {
      formData.files
          .add(MapEntry("avatar", MultipartFile.fromFileSync(params.avatar!)));
    }

    final response = await _apiClient.postRequest(
      ApiPaths.postUpdateProfileUrl,
      formData: formData,
      converter: (response) =>
          UpdateProfileResponse.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }
}
