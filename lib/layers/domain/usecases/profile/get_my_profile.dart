import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';
import 'package:storyv2/layers/domain/repositories/profile_repository.dart';

class GetMyProfile
    implements UseCase<Either<Failure, ProfileEntity>, NoParams> {
  final ProfileRepository profileRepository;

  const GetMyProfile(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams noParams) async {
    return await profileRepository.getMyProfileInfo();
  }
}
