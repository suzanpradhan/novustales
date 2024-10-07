// ignore_for_file: invalid_annotation_target

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/update_profile_entity.dart';
import '../../repositories/profile_repository.dart';

part 'generated/update_profile.freezed.dart';
part 'generated/update_profile.g.dart';

class UpdateProfile
    implements
        UseCase<Either<Failure, UpdateProfileEntity>, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  @override
  Future<Either<Failure, UpdateProfileEntity>> call(
      UpdateProfileParams params) async {
    return await repository.updateProfile(params);
  }
}

@freezed
class UpdateProfileParams with _$UpdateProfileParams {
  const factory UpdateProfileParams({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    String? bio,
    String? avatar,
    int? uuid,
  }) = _UpdateProfileParams;

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamsFromJson(json);
}
