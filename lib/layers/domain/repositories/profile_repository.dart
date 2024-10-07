import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';

import '../entities/update_profile_entity.dart';
import '../usecases/profile/update_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getMyProfileInfo();
  Future<Either<Failure, UpdateProfileEntity>> updateProfile(
      UpdateProfileParams postProfileParams);
}
