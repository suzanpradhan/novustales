import 'package:dartz/dartz.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/api/api_paths.dart';
import 'package:storyv2/layers/data/models/register_response.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';

import '../../../core/error/failures.dart';
import '../models/user_credential.dart';

abstract class AuthRemoteSource {
  Future<Either<Failure, UserCredential>> login(LoginParams params);
  Future<Either<Failure, RegisterResponse>> register(RegisterParams params);
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final ApiClient _client;

  AuthRemoteSourceImpl(this._client);

  @override
  Future<Either<Failure, UserCredential>> login(LoginParams params) async {
    final response = await _client.postRequest(
      ApiPaths.emailLoginUrl,
      data: params.toJson(),
      converter: (response) =>
          UserCredential.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterParams params) async {
    final response = await _client.postRequest(
      ApiPaths.emailRegisterUrl,
      data: params.toJson(),
      converter: (response) =>
          RegisterResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
