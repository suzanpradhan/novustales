import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/providers/common_view_model.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/helper/size.dart';
import 'package:storyv2/old/model/request/register_request.dart';
import 'package:storyv2/old/network/repo/auth_repo.dart';
import 'package:storyv2/old/widgets/app_logo.dart';
import 'package:storyv2/old/widgets/custom_appbar.dart';
import 'package:storyv2/old/widgets/custom_button.dart';
import 'package:storyv2/old/widgets/custom_phone_number.dart';
import 'package:storyv2/old/widgets/custom_text_field.dart';

import '../../../constants/text_style.dart';
import '../../../providers/auth_view_model.dart';
import '../../../widgets/appLogo_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthViewModel authViewModel;
  String? token;
  bool _visibility = false;
  bool _obsecure = true;
  final formKey = GlobalKey<FormState>();

  Color color = Colors.grey;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      authViewModel.emailNode.requestFocus();
    });
    _getId();
    FirebaseMessaging.instance.getToken().then((value) {
      setState(() {
        token = value;
      });

      print("FCM TOKEN:::$token");
    });
    super.initState();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
      ),
      body: Consumer<AuthViewModel>(builder: (context, auth, child) {
        // return ListView(
        //   padding: EdgeInsets.symmetric(horizontal: 25.sp),
        //   children: [
        //     SizedBox(
        //       height: 100.sp,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Row(
        //         children: [
        //           appLogoWidget(height: 40, width: 40),
        //           const SizedBox(
        //             width: 15,
        //           ),
        //           Text("Story",
        //               style: w6f24cwdI.copyWith(fontSize: 22, color: white))
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 60.sp,
        //     ),
        //     const Text(
        //       "Sign in to Story",
        //       style: TextStyle(
        //         fontSize: 22,
        //         fontWeight: FontWeight.w600,
        //         color: white
        //       ),
        //     ),
        //     SizedBox(
        //       height: 40.sp,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           LabelTextField(
        //             hintText: "Email",
        //             label: "Enter email ",
        //             labelColor: white,
        //             controller: auth.emailController,
        //           ),
        //           SizedBox(
        //             height: 20.sp,
        //           ),
        //           // LabelTextField(
        //           //   label: "Password",
        //           //   obscureText: _visibility,
        //           //
        //           //   labelColor: white,
        //           //   hintText: "Enter Strong password",
        //           //   controller: auth.passwordController,
        //           //   suffix: InkWell(
        //           //       onTap: () {
        //           //         setState(() {
        //           //           _visibility = !_visibility;
        //           //         });
        //           //       },
        //           //       child: Icon(_visibility
        //           //           ? Icons.visibility
        //           //           : Icons.visibility_off)),
        //           // ),
        //           // const SizedBox(
        //           //   height: 5,
        //           // )
        //         ],
        //       ),
        //     ),
        //     // TextButton(
        //     //     onPressed: () {},
        //     //     child: const Text(
        //     //       "Forget Password?",
        //     //       style: TextStyle(color: lightTabBlue, fontSize: 16),
        //     //     )),
        //     // const SizedBox(
        //     //   height: 30,
        //     // ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //       child: SizedBox(
        //         height: 60,
        //         child: CustomButton(
        //
        //           buttonName: "Continue",
        //           hasBorder: false,
        //           containerColor: const Color(0xFF58ADCA),
        //           onTap: () async {
        //             String? deviceId = await _getId();
        //             print("FCM TOKEN IS::${token.toString()}");
        //             auth.login(token, deviceId);
        //           },
        //         ),
        //       ),
        //     ),
        //   ],
        // );

        return Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.blue,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
                  ],
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmail,
                  onChanged: (_) {
                    setState(() {
                      _visibility = false;
                      auth.passwordController.text = "";
                      if (auth.emailController.text.isEmpty) {
                        color = Colors.grey;
                      } else if (formKey.currentState!.validate()) {
                        color = Color(0xFF58ADCA);
                      } else {
                        color = Colors.grey;
                      }
                    });
                  },
                  style: TextStyle(color: black),
                  controller: auth.emailController,
                  focusNode: auth.emailNode,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                      hintText: "Enter email",
                      hintStyle: TextStyle(color: grey_400)),
                ),
              ),
              Visibility(
                visible: _visibility,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.text,
                    onChanged: (_) {
                      setState(() {
                        color = auth.passwordController.text.isEmpty
                            ? Colors.grey
                            : Color(0xFF58ADCA);
                      });
                    },
                    style: TextStyle(color: black),
                    controller: auth.passwordController,
                    focusNode: auth.passwordNode,
                    obscureText: _obsecure,
                    decoration: InputDecoration(
                        suffixIcon: auth.passwordController.text.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obsecure = !_obsecure;
                                  });
                                },
                                icon: Icon(
                                  !_obsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                        )),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                        )),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                        )),
                        hintText: "Enter password",
                        hintStyle: TextStyle(color: grey_400)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  height: 60,
                  child: CustomButton(
                    buttonName: _visibility ? "Sign in" : "Continue",
                    hasBorder: false,
                    containerColor: color,
                    onTap: (auth.emailController.text.isEmpty)
                        ? null
                        : () async {
                            if (_visibility) {
                              if (auth.passwordController.text.isEmpty) {
                              } else {
                                String? deviceId = await _getId();
                                print("FCM TOKEN IS::${token.toString()}");
                                auth.login(token, deviceId);
                              }
                            } else {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  _visibility = true;
                                  color = Colors.grey;
                                });
                              }
                            }
                          },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    authViewModel.emailController.clear();
    authViewModel.passwordController.clear();
    authViewModel.emailNode.unfocus();
    authViewModel.passwordNode.unfocus();
    super.dispose();
  }
}
