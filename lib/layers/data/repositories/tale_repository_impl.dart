import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/data/sources/tale_source.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';
import 'package:storyv2/layers/domain/repositories/tale_repository.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_direction.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';
import 'package:storyv2/layers/domain/usecases/tales/search_tales.dart';
import 'package:storyv2/utils/google_maps_service.dart';

class TaleRepositoryImpl implements TaleRepository {
  final TaleSource taleSource;
  final GoogleMapsService mapsService;

  const TaleRepositoryImpl({required this.taleSource, required this.mapsService});

  @override
  Future<Either<Failure, List<TaleEntity>>> getPopularTales() async {
    final response = await taleSource.getPopularTales(NoParams());
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((tale) => tale.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<TaleEntity>>> getNearMeTales(NearMeTalesParams params) async {
    final response = await taleSource.getNearMeTales(params);
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((tale) => tale.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<TaleEntity>>> searchTales(SearchTalesParams params) async {
    final response = await taleSource.searchTales(params);
    return response.fold((failure) => Left(failure), (response) {
      return Right(response.map((tale) => tale.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<LatLng>>> getDirection(GetDirectionParams params) async {
    try {
      final points =
          await mapsService.getDirection(origin: params.origin, destination: params.destination);
      return Right(points);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: "Failed to get directions"));
    }
  }
}
