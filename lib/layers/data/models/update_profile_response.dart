import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/update_profile_entity.dart';
import 'user_detail.dart';

part 'generated/update_profile_response.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class UpdateProfileResponse with _$UpdateProfileResponse {
  const UpdateProfileResponse._();

  const factory UpdateProfileResponse({UserDetail? updatedProfile}) =
      _UpdateProfileResponse;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse(updatedProfile: UserDetail.fromJson(json));

  UpdateProfileEntity toEntity() => UpdateProfileEntity(
        firstName: updatedProfile?.profile?.firstName,
        lastName: updatedProfile?.profile?.lastName,
        bio: updatedProfile?.profile?.bio,
        avatar: updatedProfile?.profile?.avatar,
        uuid: updatedProfile?.profile?.id,
      );
}
