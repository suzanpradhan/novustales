part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.checkingAuthentication() = _CheckingAuthentication;
  const factory AppState.authenticated() = _Authenticated;
  const factory AppState.unAuthenticated({String? message}) = _UnAuthenticted;
  const factory AppState.clearedSession() = _ClearedSession;
}
