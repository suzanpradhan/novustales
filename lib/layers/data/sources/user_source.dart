import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

import '../../../core/api/api_client.dart';
import '../../../core/error/failures.dart';
import '../../../utils/secure_storage.dart';
import '../../../utils/services/isar_service.dart';
import '../models/schemas/user_data.dart';

abstract class UserSource {
  // Future<Either<Failure, UserData>> saveUser(UserData userData);
  Future<Either<Failure, UserData>> saveUser(UserData userData);
  Future<Either<Failure, UserData>> getMySavedProfile();
}

class UserSourceImpl implements UserSource {
  final ApiClient _client;
  final IsarServiceMixin isarService;
  final SecureStorageMixin secureStorageMixin;

  UserSourceImpl(this._client, this.secureStorageMixin, this.isarService);

  @override
  Future<Either<Failure, UserData>> getMySavedProfile() async {
    String? uuid = await secureStorageMixin.getValue(SecureStorageKeys.uuid);
    if (uuid != null) {
      final userData = await isarService.isar.userDatas
          .filter()
          .uuidEqualTo(uuid)
          .findFirst();

      if (userData != null) {
        return Right(userData);
      } else {
        return Left(NotFoundFailure());
      }
    } else {
      final guestUserData = await isarService.isar.userDatas
          .filter()
          .isGuestEqualTo(true)
          .findFirst();
      return (guestUserData != null)
          ? Right(guestUserData)
          : Left(NotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> saveUser(UserData userData) async {
    log("first>>>>>>>>>>>>>>>>>>>>>>${userData.uuid}");
    if (userData.uuid != null) {
      await isarService.isar.writeTxn(() async {
        await isarService.isar.userDatas.clear();
        log(">>>>>>>>>>>>>>>>>>>>>>${userData.isSeller}");
        await isarService.isar.userDatas.put(userData);
      });
      await secureStorageMixin.storeValue(
          key: SecureStorageKeys.uuid, value: userData.uuid!);
    } else {
      return const Left(StorageFailure(message: "User uuid is required"));
    }

    return getMySavedProfile();
  }
}
