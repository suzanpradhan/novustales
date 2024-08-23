import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/sources/profile_source.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';
import 'package:storyv2/layers/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileSource profileSource;

  const ProfileRepositoryImpl({
    required this.profileSource,
  });

  @override
  Future<Either<Failure, ProfileEntity>> getMyProfileInfo() async {
    final response = await profileSource.getMyProfile(NoParams());
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.toEntity());
    });
  }
}
