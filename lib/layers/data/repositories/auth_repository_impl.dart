import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/entities/register_entity.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';
import 'package:storyv2/utils/secure_storage.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/auth_remote_source.dart';
import '../sources/profile_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;
  final SecureStorageMixin secureStorageMixin;
  final ProfileSource profileSource;

  const AuthRepositoryImpl({
    required this.authRemoteSource,
    required this.profileSource,
    required this.secureStorageMixin,
  });

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams) async {
    final response = await authRemoteSource.login(loginParams);
    return response.fold((failure) => Left(failure), (userCredential) async {
      if (userCredential.accessToken != null) {
        await secureStorageMixin.storeValue(
            key: SecureStorageKeys.token, value: userCredential.accessToken!);
        await secureStorageMixin.storeValue(
            key: SecureStorageKeys.isLogin, value: "true");
      }
      final profileResponse = await profileSource.getMyProfile(NoParams());
      return profileResponse.fold((failure) => Left(failure), (response) async {
        final uuid = await secureStorageMixin.getValue(SecureStorageKeys.uuid);
        final id = await secureStorageMixin.getValue(SecureStorageKeys.id);

        if (uuid == null || uuid.isEmpty) {
          await secureStorageMixin.storeValue(
              key: SecureStorageKeys.uuid, value: response.uuid);
        }
        if (id == null || id.isEmpty) {
          await secureStorageMixin.storeValue(
              key: SecureStorageKeys.id, value: response.id.toString());
        }
        return Right(userCredential.toEntity());
      });
    });
  }

  @override
  Future<Either<Failure, RegisterEntity>> register(
      RegisterParams registerParams) async {
    final response = await authRemoteSource.register(registerParams);

    return response.fold((failure) => Left(failure),
        (registerResponse) => Right(registerResponse.toEntity()));
  }

  @override
  Future<Either<Failure, LogoutEntity>> logout(NoParams noParams) async {
    try {
      await secureStorageMixin.clearValue(SecureStorageKeys.token);
      await secureStorageMixin.clearValue(SecureStorageKeys.isLogin);
      await secureStorageMixin.clearValue(SecureStorageKeys.uuid);
      await secureStorageMixin.clearValue(SecureStorageKeys.id);

      return const Right(LogoutEntity(message: "You are logged out"));
    } catch (e) {
      return const Left(StorageFailure(message: "Failed to log out"));
    }
  }
}
