part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.checkAuthetication() = _CheckAuthentication;
  const factory AppEvent.clearSession() = _ClearSession;
}
