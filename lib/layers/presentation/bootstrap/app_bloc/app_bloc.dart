import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/utils/secure_storage.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'generated/app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const _Initial()) {
    on<AppEvent>((event, emit) {});

    on<_CheckAuthentication>((event, emit) async {
      if (!(((await SecureStorageMixin.secureStorage
                  ?.read(key: SecureStorageKeys.isLogin.name)) ??
              "false") ==
          "true")) {
        emit(const AppState.unAuthenticated());
      } else {
        emit(AppState.authenticated());
      }
    });

    // on<_ClearSession>((event, emit) async {
    //   final data = await getLogout.call(NoParams());
    //   data.fold((failure) {
    //     emit(const AppState.clearedSession());
    //   }, (logout) => emit(const AppState.clearedSession()));
    // });
  }
}
