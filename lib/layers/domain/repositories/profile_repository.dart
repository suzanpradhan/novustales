import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getMyProfileInfo();
}
