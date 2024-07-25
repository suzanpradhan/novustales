// ignore_for_file: invalid_annotation_target

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/register_entity.dart';
import 'package:storyv2/layers/domain/repositories/auth_repository.dart';

part 'generated/post_register.freezed.dart';
part 'generated/post_register.g.dart';

class PostRegister
    implements UseCase<Either<Failure, RegisterEntity>, RegisterParams> {
  final AuthRepository authRepository;

  const PostRegister(this.authRepository);

  @override
  Future<Either<Failure, RegisterEntity>> call(RegisterParams params) async {
    return await authRepository.register(params);
  }
}

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams(
      {@Default("first_name") String firstName,
      @JsonKey(name: "last_name") @Default("") String lastName,
      @Default("") String email,
      @Default("") String password}) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
