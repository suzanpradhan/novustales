// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'profile_response.dart';

part 'generated/user_detail.freezed.dart';
part 'generated/user_detail.g.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    int? id,
    String? username,
    String? email,
    @MapToUserConverter() ProfileResponse? profile,
  }) = _UserDetail;

  const UserDetail._();

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}

class MapToUserConverter
    implements JsonConverter<ProfileResponse, Map<String, dynamic>> {
  const MapToUserConverter();

  @override
  ProfileResponse fromJson(Map<String, dynamic> json) {
    return ProfileResponse.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ProfileResponse object) {
    throw UnimplementedError();
  }
}
