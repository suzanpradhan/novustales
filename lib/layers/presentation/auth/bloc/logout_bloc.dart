import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/authentication/get_logout.dart';

part 'generated/logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final GetLogout _getLogout;
  LogoutBloc(this._getLogout) : super(const _Initial()) {
    on<LogoutEvent>((event, emit) {});
    on<_Attempt>((event, emit) async {
      emit(const _Loading());

      final data = await _getLogout.call(NoParams());
      data.fold((failure) {
        // log("jiniu");
        if (failure is StorageFailure) {
          emit(_Failure(failure.message ?? "Server Error!"));
        }
      }, (logout) => emit(_Success(logout.message)));
    });
  }
}
