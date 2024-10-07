import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/update_profile_entity.freezed.dart';

@freezed
class UpdateProfileEntity with _$UpdateProfileEntity {
  const factory UpdateProfileEntity({
    String? message,
    bool? error,
    int? uuid,
    String? firstName,
    String? lastName,
    String? bio,
    String? avatar,
  }) = _UpdateProfileEntity;
}
