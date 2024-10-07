import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/sources/profile_source.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';
import 'package:storyv2/layers/domain/repositories/profile_repository.dart';

import '../../../utils/secure_storage.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../../domain/usecases/profile/update_profile.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileSource profileSource;
  final SecureStorageMixin secureStorageMixin;

  const ProfileRepositoryImpl({
    required this.profileSource,
    required this.secureStorageMixin,
  });

  @override
  Future<Either<Failure, ProfileEntity>> getMyProfileInfo() async {
    final response = await profileSource.getMyProfile(NoParams());
    return response.fold((failure) => Left(failure), (response) async {
      final uuid = await secureStorageMixin.getValue(SecureStorageKeys.uuid);
      if (uuid == null) {
        await secureStorageMixin.storeValue(
            key: SecureStorageKeys.uuid, value: response.uuid);
      }
      return Right(response.toEntity());
    });
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> updateProfile(
      UpdateProfileParams params) async {
    final response = await profileSource.updateProfile(params);
    return response.fold((failure) => Left(failure), (updateProfileResponse) {
      return Right(updateProfileResponse.toEntity());
    });
  }
}
