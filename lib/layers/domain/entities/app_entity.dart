import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/app_entity.freezed.dart';

@freezed
class AppEntity with _$AppEntity {
  const factory AppEntity({
    required bool isFirstTime,
  }) = _AppEntity;
}
