import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/chat_repository.dart';

part 'generated/check_or_create_profile.freezed.dart';
part 'generated/check_or_create_profile.g.dart';

class CheckOrCreateProfile {
  final ChatRepository chatRepository;

  CheckOrCreateProfile(this.chatRepository);

  Future<bool> call(CheckOrCreateProfileParams params) async {
    return await (chatRepository.checkOrCreateProfile(params));
  }
}

@freezed
class CheckOrCreateProfileParams with _$CheckOrCreateProfileParams {
  const factory CheckOrCreateProfileParams({
    required String uuid,
    String? avatar,
    String? name,
    String? email,
  }) = _CheckOrCreateProfileParams;

  factory CheckOrCreateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$CheckOrCreateProfileParamsFromJson(json);
}
