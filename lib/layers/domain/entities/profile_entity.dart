import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity(
          {required int id,
          required String uuid,
          required String email,
          @JsonKey(name: 'first_name') required String firstName,
          @JsonKey(name: 'last_name') required String lastName,
          @JsonKey(name: 'nick_name') required String nickName,
          String? avatar,
          String? bio,
          @Default(0) int followers,
          @Default(0) int following,
          @JsonKey(name: 'number_of_stories') @Default(0) int numberOfStories,
          @JsonKey(name: 'number_of_views') @Default(0) int numberOfViews}) =
      _ProfileEntity;
}
