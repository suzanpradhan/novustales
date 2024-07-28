import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({String? token}) = _LoginEntity;
}
