import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/logout_entity.dart';
import '../../repositories/auth_repository.dart';

class GetLogout implements UseCase<Either<Failure, LogoutEntity>, NoParams> {
  final AuthRepository repository;

  GetLogout(this.repository);

  @override
  Future<Either<Failure, LogoutEntity>> call(NoParams noParams) async {
    return await repository.logout(NoParams());
  }
}
