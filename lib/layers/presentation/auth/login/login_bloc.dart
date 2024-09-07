import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_login.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/presentation/ui/email_input.dart';
import '../../../../core/presentation/ui/password_input.dart';
import '../../../domain/usecases/chat/check_or_create_profile.dart';
import '../../../domain/usecases/profile/get_my_profile.dart';

part 'generated/login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLogin _postLogin;
  final GetMyProfile _getMyProfile;
  final CheckOrCreateProfile _checkOrCreateProfile;
  LoginBloc(this._postLogin, this._getMyProfile, this._checkOrCreateProfile)
      : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
    on<_ValidateEmail>((event, emit) {
      final email = EmailInput.dirty(event.email);
      emit(
        state.copyWith(
          email: email,
          isValid: Formz.validate([state.password, email]),
        ),
      );
    });
    on<_ValidatePassword>((event, emit) {
      final password = PasswordInput.dirty(event.password);
      emit(
        state.copyWith(
          password: password,
          isValid: Formz.validate([state.email, password]),
        ),
      );
    });

    on<_Attempt>((event, emit) async {
      emit(state.copyWith(
          status: FormzSubmissionStatus.inProgress, isFirstAttempt: false));

      if (state.isValid) {
        final loginResult = await _postLogin.call(LoginParams(
          email: state.email.value,
          password: state.password.value,
        ));

        await loginResult.fold((failure) async {
          emitFailure(failure, emit);
        }, (loginSuccess) async {
          final profileResult = await _getMyProfile.call(NoParams());

          await profileResult.fold((failure) async {
            emitFailure(failure, emit);
          }, (profile) async {
            final checkOrCreateResult = await _checkOrCreateProfile.call(
              CheckOrCreateProfileParams(
                uuid: profile.uuid,
                avatar: profile.avatar,
                email: profile.email,
                name: profile.firstName + profile.lastName,
              ),
            );

            if (checkOrCreateResult) {
              emit(state.copyWith(
                status: FormzSubmissionStatus.success,
              ));
            } else {
              emit(state.copyWith(
                status: FormzSubmissionStatus.failure,
                message: "Server Error!",
              ));
            }
          });
        });
      } else {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: "Please verify your details.",
        ));
      }
    });

    on<_GoogleSignInAttempt>((event, emit) async {});

    on<_AppleSignInAttempt>((event, emit) async {});
  }

  emitFailure(Failure failure, Emitter<LoginState> emit) {
    if (failure is ServerFailure) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: failure.message ?? "Server Error!"));
    } else if (failure is UnauthorizedFailure) {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure, message: "Login Failed!"));
    }
  }
}
