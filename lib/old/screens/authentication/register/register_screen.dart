import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/providers/auth_view_model.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';
import 'package:storyv2/old/widgets/custom_button.dart';
import 'package:storyv2/old/widgets/custom_text_field.dart';

import '../../../model/response/google_user_model.dart';
import '../../../network/repo/google_auth_repo.dart';
import '../../onboarding/components/single_compo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _visibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Consumer<AuthViewModel>(builder: (context, auth, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        RouteGenerator.goBack();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: black,
                      ))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.sp),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 20.sp,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       appLogoWidget(height: 40, width: 40),
                    //       const SizedBox(
                    //         width: 15,
                    //       ),
                    //       Text("Story",
                    //           style: w6f24cwdI.copyWith(fontSize: 22, color: black))
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 60.sp,
                    // ),
                    const Text(
                      "Create an Account",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelTextField(
                            hintText: "Enter first name",
                            controller: auth.fNameController,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          // CustomPhoneNumber(
                          //   label: "Phone Number",
                          //   controller: auth.phoneController,
                          // ),
                          LabelTextField(
                            hintText: "Enter last name",
                            controller: auth.lNameController,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          LabelTextField(
                            hintText: "Enter email",
                            controller: auth.emailController,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          LabelTextField(
                            obscureText: true,
                            hintText: "Enter strong password",
                            suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _visibility = !_visibility;
                                  });
                                },
                                child: Icon(
                                  _visibility
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                )),
                            controller: auth.passwordController,
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: CustomButton(
                        buttonName: "Next",
                        hasBorder: false,
                        containerColor: const Color(0xFF58ADCA),
                        onTap: () async {
                          await auth.register();
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          RouteGenerator.replacePage(routeLogin);
                        },
                        child: const Text(
                          "Already have an account",
                          style: TextStyle(color: lightTabBlue, fontSize: 16),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      "OR",
                      style: TextStyle(color: black),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleCompo(
                      onTap: () async {
                        // googleSignIn(common);
                        GoogleUserModel? google =
                            await GoogleAuthRepo().signIn();
                        if (google != null && context.mounted) {
                          try {
                            String url =
                                "https://brain.novutales.com/auth/users/register_with_sso/google/";

                            Response response = await post(
                              Uri.parse(url),
                              body: {"token": google.accessToken},
                            );

                            if (response.statusCode == 200 && context.mounted) {
                              showTopOverlayNotification(title: "User created");

                              Navigator.pop(context);
                            }
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        }

                        await GoogleAuthRepo().signOut();
                      },
                      imagePath: "assets/images/bg_google.png",
                      label: "SIGN UP WITH GOOGLE",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
