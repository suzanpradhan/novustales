import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/presentation/widgets/simple_button.dart';
import 'package:storyv2/core/routes/app_routes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/email_input.dart';
import '../../../../core/presentation/ui/password_input.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/ui/text_input.dart';
import '../../../../core/presentation/widgets/form_fields/form_input_field.dart';
import '../login/login_bloc.dart';
import '../register/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double heightWithoutappBarNavBar = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).viewPadding.top +
            kToolbarHeight +
            MediaQuery.of(context).padding.bottom);
    return Scaffold(
        appBar: AppBar(
          title: const Text("LOGO"),
          centerTitle: true,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<RegisterBloc, RegisterState>(
              listener: (_, state) {
                switch (state.status) {
                  case FormzSubmissionStatus.success:
                    context.go(LOGIN_ROUTE);
                    break;
                  default:
                    break;
                }
              },
            ),
          ],
          child: SingleChildScrollView(
            child: AutofillGroup(
              child: Form(
                child: Container(
                  height: heightWithoutappBarNavBar,
                  constraints:
                      BoxConstraints(minHeight: heightWithoutappBarNavBar),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Create an account',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                                child: Text(
                                  'Let’s create an account for you.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                ),
                              ),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return FormInputField(
                                    placeholder: "Full Name",
                                    textInputType: TextInputType.name,
                                    context: context,
                                    errorText: state.isFirstAttempt
                                        ? null
                                        : state.fullName.displayError ==
                                                FullNameValidationError.empty
                                            ? "Full name is required"
                                            : state.fullName.displayError ==
                                                    FullNameValidationError
                                                        .invalid
                                                ? "Enter a valid full name"
                                                : null,
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                          RegisterEvent.validateName(
                                              name: value));
                                    },
                                    alignment: InputAlignment.vertical,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return FormInputField(
                                    placeholder: "Email",
                                    textInputType: TextInputType.emailAddress,
                                    context: context,
                                    errorText: state.isFirstAttempt
                                        ? null
                                        : state.email.displayError ==
                                                EmailValidationError.empty
                                            ? "Email is required"
                                            : state.email.displayError ==
                                                    EmailValidationError.invalid
                                                ? "Enter a valid email"
                                                : null,
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                          RegisterEvent.validateEmail(
                                              email: value));
                                    },
                                    alignment: InputAlignment.vertical,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return FormInputField(
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    isSecret: true,
                                    errorText: state.isFirstAttempt
                                        ? null
                                        : state.password.displayError ==
                                                PasswordValidationError.empty
                                            ? "Password is required"
                                            : state.password.displayError ==
                                                    PasswordValidationError
                                                        .atLeastSix
                                                ? "Minimum 6 characters"
                                                : null,
                                    placeholder: "Password",
                                    context: context,
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                          RegisterEvent.validatePassword(
                                              password: value));
                                    },
                                    alignment: InputAlignment.vertical,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return FormInputField(
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    isSecret: true,
                                    errorText: state.isFirstAttempt
                                        ? null
                                        : state.confirmPassword.displayError ==
                                                PasswordValidationError.empty
                                            ? "Password is required"
                                            : state.confirmPassword
                                                        .displayError ==
                                                    PasswordValidationError
                                                        .atLeastSix
                                                ? "Minimum 6 characters"
                                                : null,
                                    placeholder: "Confirm Password",
                                    context: context,
                                    onChanged: (value) {
                                      context.read<RegisterBloc>().add(
                                          RegisterEvent.validateConfirmPassword(
                                              confirmPassword: value));
                                    },
                                    alignment: InputAlignment.vertical,
                                  );
                                },
                              ),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  if (state.status.isFailure &&
                                      state.message != null) {
                                    return Container(
                                      height: 38,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onError),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .errorContainer),
                                      margin: const EdgeInsets.only(
                                          top: UIConstants.padding),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.error_outline,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onErrorContainer,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            state.message!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onErrorContainer),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                              Gapper.vmxGap(),
                              BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return SimpleButton(
                                    buttonLabel: "Register",
                                    isFilled: true,
                                    fillColor: AppColors.purpleAccent,
                                    isLoading: state.status.isInProgress,
                                    alignment: MainAxisAlignment.center,
                                    handleTap: () {
                                      context
                                          .read<RegisterBloc>()
                                          .add(const RegisterEvent.attempt());
                                    },
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        width: 40,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: Text(
                                        'OR REGISTER WITH EMAIL'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        width: 40,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return SimpleButton(
                                    handleTap: () {
                                      context.read<LoginBloc>().add(
                                          const LoginEvent
                                              .googleSignInAttempt());
                                    },
                                    alignment: MainAxisAlignment.spaceBetween,
                                    prefixWidget: const SizedBox(
                                        height: 32,
                                        width: 32,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/google_logo.png'))),
                                    suffixWidget: const SizedBox(
                                      width: 20,
                                    ),
                                    isLoading: state.googleSignInSatus ==
                                        FormzSubmissionStatus.inProgress,
                                    splashColor:
                                        AppColors.dark.withOpacity(0.2),
                                    buttonLabel: 'Sign up with Google',
                                    textColor: Colors.black,
                                    progressColor: AppColors.gray,
                                    borderColor: AppColors.grayDark,
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 32,
                                    child: TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              children: const [
                                                TextSpan(
                                                    text:
                                                        "Already have an account?",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .grayDark)),
                                                TextSpan(
                                                    text: " Sign In",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .purpleAccent))
                                              ]),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Terms and Conditions",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
