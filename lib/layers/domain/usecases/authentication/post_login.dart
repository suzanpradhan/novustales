import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/login_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../layers/domain/repositories/auth_repository.dart';

part 'generated/post_login.freezed.dart';
part 'generated/post_login.g.dart';

class PostLogin implements UseCase<Either<Failure, LoginEntity>, LoginParams> {
  final AuthRepository repository;

  PostLogin(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await repository.login(params);
  }
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams(
      {@Default("") String email, @Default("") String password}) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
