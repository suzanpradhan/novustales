import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/assets.dart';
import 'package:storyv2/core/presentation/widgets/simple_button.dart';
import 'package:storyv2/layers/presentation/bootstrap/app_bloc/app_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/email_input.dart';
import '../../../../core/presentation/ui/password_input.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/form_fields/form_input_field.dart';
import '../../../../core/routes/app_routes.dart';
import '../login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

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
      body: SafeArea(
          child: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (_, state) {
              if (state.status == FormzSubmissionStatus.success ||
                  state.googleSignInSatus == FormzSubmissionStatus.success ||
                  state.appleSignInStatus == FormzSubmissionStatus.success) {
                context
                    .read<AppBloc>()
                    .add(const AppEvent.checkAuthetication());
              } else {
                if (state.isFirstAttempt &&
                    state.googleSignInSatus == FormzSubmissionStatus.failure &&
                    state.message != null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message!)));
                } else if (state.isFirstAttempt &&
                    state.appleSignInStatus == FormzSubmissionStatus.failure &&
                    state.message != null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message!)));
                }
              }
            },
          ),
          BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              state.mapOrNull(
                authenticated: (isGuest) {
                  context.go(HOME_ROUTE);
                },
              );
            },
          ),
        ],
        child: SingleChildScrollView(
          child: AutofillGroup(
            child: Form(
              key: _loginFormKey,
              child: Container(
                height: heightWithoutappBarNavBar,
                constraints:
                    BoxConstraints(minHeight: heightWithoutappBarNavBar),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              'Welcome Back!',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 5, 18, 30),
                            child: Text(
                                'Sign in by entering the information below',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return FormInputField(
                                  // controller: _emailController,
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
                                    context.read<LoginBloc>().add(
                                        LoginEvent.validateEmail(email: value));
                                  },
                                  alignment: InputAlignment.vertical,
                                  // onSaved: (value) {
                                  //   if (value != null) {
                                  //     _emailController.text = value;
                                  //   }
                                  // }
                                );
                              },
                            ),
                          ),
                          Gapper.vmGap(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return FormInputField(
                                  textInputType: TextInputType.visiblePassword,
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
                                  // controller: _passwordController,
                                  placeholder: "Password",
                                  context: context,
                                  onChanged: (value) {
                                    context.read<LoginBloc>().add(
                                        LoginEvent.validatePassword(
                                            password: value));
                                  },
                                  alignment: InputAlignment.vertical,
                                  // onSaved: (value) {
                                  //   if (value != null) {
                                  //     _passwordController.text = value;
                                  //   }
                                  // }
                                );
                              },
                            ),
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state.status.isFailure &&
                                  state.message != null) {
                                return Container(
                                  constraints:
                                      const BoxConstraints(minHeight: 38),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onError),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .errorContainer),
                                  margin:
                                      const EdgeInsets.fromLTRB(18, 12, 18, 0),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Text(
                                            state.message!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onErrorContainer),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: SizedBox(
                                    height: 32,
                                    child: TextButton(
                                        onPressed: () {
                                          // context.push(FORGOT_PASSWORD_ROUTE);
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: SimpleButton(
                                  buttonLabel: "Login",
                                  isFilled: true,
                                  fillColor: AppColors.purpleAccent,
                                  isLoading: state.status.isInProgress,
                                  alignment: MainAxisAlignment.center,
                                  handleTap: () {
                                    context
                                        .read<LoginBloc>()
                                        .add(const LoginEvent.attempt());
                                    // }
                                  },
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 18),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: 40,
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: UIConstants.minPadding),
                                  child: Text(
                                    'OR',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColors.grayDark),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: 40,
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: SimpleButton(
                                  handleTap: () {
                                    context.read<LoginBloc>().add(
                                        const LoginEvent.googleSignInAttempt());
                                  },
                                  alignment: MainAxisAlignment.spaceBetween,
                                  prefixWidget: const SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: Image(
                                          image:
                                              AssetImage(Assets.googleLogo))),
                                  suffixWidget: const SizedBox(
                                    width: 20,
                                  ),
                                  isLoading: state.googleSignInSatus ==
                                      FormzSubmissionStatus.inProgress,
                                  splashColor: AppColors.dark.withOpacity(0.2),
                                  buttonLabel: 'Continue with Google',
                                  textColor: Colors.black,
                                  progressColor: AppColors.gray,
                                  borderColor: AppColors.grayDark,
                                ),
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
                                      context.push(REGISTER_ROUTE);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          children: const [
                                            TextSpan(
                                                text: "Don't have an account?",
                                                style: TextStyle(
                                                    color: AppColors.grayDark)),
                                            TextSpan(
                                                text: " Sign up",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.purpleAccent))
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
                                  .displayMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
