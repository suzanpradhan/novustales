import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/repositories/tale_repository.dart';

part 'generated/get_direction.freezed.dart';

class GetDirection implements UseCase<Either<Failure, List<LatLng>>, GetDirectionParams> {
  final TaleRepository taleRepository;

  const GetDirection(this.taleRepository);

  @override
  Future<Either<Failure, List<LatLng>>> call(GetDirectionParams params) async {
    return await taleRepository.getDirection(params);
  }
}

@Freezed(toJson: false, fromJson: false)
class GetDirectionParams with _$GetDirectionParams {
  const factory GetDirectionParams({
    required LatLng origin,
    required LatLng destination,
  }) = _GetDirectionParams;
}
