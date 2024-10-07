import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/presentation/ui/text_input.dart';
import '../../../../domain/entities/profile_entity.dart';
import '../../../../domain/usecases/profile/update_profile.dart';

part 'generated/update_profile_bloc.freezed.dart';
part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfile updateProfile;
  final ProfileEntity currentProfileData;
  UpdateProfileBloc(
      {required this.updateProfile, required this.currentProfileData})
      : super(UpdateProfileState(
          firstName: TextInput.dirty(currentProfileData.firstName ?? ""),
          lastName: TextInput.dirty(currentProfileData.lastName ?? ""),
          bio: TextInput.dirty(currentProfileData.bio ?? ""),
          avatar: TextInput.dirty(currentProfileData.avatar ?? ""),
        )) {
    on<UpdateProfileEvent>((event, emit) {});

    on<_ValidateFirstName>((event, emit) {
      final firstName = TextInput.dirty(event.firstName);

      emit(
        state.copyWith(
          firstName: firstName,
        ),
      );
    });

    on<_ValidateLastName>((event, emit) {
      final lastName = TextInput.dirty(event.lastName);

      emit(
        state.copyWith(
          lastName: lastName,
        ),
      );
    });

    on<_ValidateBio>((event, emit) {
      final bio = TextInput.dirty(event.bio);
      emit(
        state.copyWith(
          bio: bio,
        ),
      );
    });

    on<_ValidateImage>((event, emit) {
      final avatar = TextInput.dirty(event.avatar);
      emit(
        state.copyWith(
          avatar: avatar,
        ),
      );
    });

    on<_ExtraFields>(
      (event, emit) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.initial,
            uuid: event.uuid,
          ),
        );
      },
    );

    on<_Attempt>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.inProgress,
            isValid: Formz.validate(
              [state.firstName, state.lastName, state.bio],
            ),
          ),
        );
        log("firstName: ${state.firstName.value} lastName: ${state.lastName.value} avatar: ${state.avatar.value} bio: ${state.bio.value}");

        if (state.isValid) {
          final data = await updateProfile.call(
            UpdateProfileParams(
              uuid: state.uuid,
              firstName: state.firstName.value,
              lastName: state.lastName.value,
              bio: state.bio.value,
              avatar: state.avatar.value,
            ),
          );

          data.fold((failure) {
            if (failure is ServerFailure) {
              emit(state.copyWith(
                  status: FormzSubmissionStatus.failure,
                  message: failure.message ?? "Server Error!"));
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
      },
    );
  }
}
