import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/entities/register_entity.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';

import '../../../core/error/failures.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams loginParams);
  Future<Either<Failure, RegisterEntity>> register(
      RegisterParams registerParams);
}
