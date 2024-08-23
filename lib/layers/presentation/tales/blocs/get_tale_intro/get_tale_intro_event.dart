part of 'get_tale_intro_bloc.dart';

@freezed
class GetTaleIntroEvent with _$GetTaleIntroEvent {
  const factory GetTaleIntroEvent.request({TaleEntity? tale}) = _Request;
  const factory GetTaleIntroEvent.reInitiate({TaleEntity? tale}) = _ReInitiate;
}
