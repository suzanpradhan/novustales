import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';

import '../../entities/tale_entity.dart';
import '../../repositories/tale_repository.dart';

part 'generated/get_near_me_tales.freezed.dart';
part 'generated/get_near_me_tales.g.dart';

class GetNearMeTales implements UseCase<Either<Failure, List<TaleEntity>>, NearMeTalesParams> {
  final TaleRepository taleRepository;

  const GetNearMeTales(this.taleRepository);

  @override
  Future<Either<Failure, List<TaleEntity>>> call(NearMeTalesParams params) async {
    return await taleRepository.getNearMeTales(params);
  }
}

@freezed
class NearMeTalesParams with _$NearMeTalesParams {
  const factory NearMeTalesParams(
      {required String latitude,
      required String longitude,
      required String radius}) = _NearMeTalesParams;

  factory NearMeTalesParams.fromJson(Map<String, dynamic> json) =>
      _$NearMeTalesParamsFromJson(json);
}
