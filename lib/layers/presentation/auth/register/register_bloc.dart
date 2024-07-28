import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/layers/domain/usecases/authentication/post_register.dart';

import '../../../../core/presentation/ui/email_input.dart';
import '../../../../core/presentation/ui/password_input.dart';
import '../../../../core/presentation/ui/text_input.dart';

part 'generated/register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final PostRegister postRegister;
  RegisterBloc(this.postRegister) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {});
    on<_ValidateEmail>((event, emit) {
      final email = EmailInput.dirty(event.email);
      emit(
        state.copyWith(
          email: email,
        ),
      );
    });

    on<_ValidatePassword>((event, emit) {
      final password = PasswordInput.dirty(event.password);
      emit(
        state.copyWith(
          password: password,
        ),
      );
    });

    on<_ValidateConfirmPassword>((event, emit) {
      final confirmPassword = PasswordInput.dirty(event.confirmPassword);
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
        ),
      );
    });

    on<_ValidateName>((event, emit) {
      final fullName = TextInput.dirty(event.name);
      emit(
        state.copyWith(
          fullName: fullName,
        ),
      );
    });

    on<_Attempt>((event, emit) async {
      emit(state.copyWith(
          status: FormzSubmissionStatus.inProgress,
          isFirstAttempt: false,
          isValid: Formz.validate([
            state.password,
            state.email,
            state.confirmPassword,
            state.fullName,
          ])));

      if (state.isValid) {
        final splitNames = state.fullName.value.split(" ");
        final data = await postRegister.call(RegisterParams(
            email: state.email.value,
            password: state.password.value,
            firstName: splitNames.first,
            lastName: splitNames.length >= 2 ? splitNames[1] : ""));

        data.fold((failure) {
          if (failure is ServerFailure) {
            emit(state.copyWith(
                status: FormzSubmissionStatus.failure,
                message: failure.message ?? "Server Error!"));
          } else if (failure is ValidationFailure) {
            emit(state.copyWith(
                status: FormzSubmissionStatus.failure,
                message: failure.message ?? "Validation Error!"));
          }
        },
            (registerResponse) => emit(state.copyWith(
                status: FormzSubmissionStatus.success,
                message: registerResponse.message)));
      } else {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            message: "Please verify your details."));
      }
    });
  }
}
