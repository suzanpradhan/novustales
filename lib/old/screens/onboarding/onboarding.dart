import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/app_image.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/network/repo/auth_repo.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/preference_utils.dart';
import '../../helper/custom_loader.dart';
import '../../providers/common_view_model.dart';
import 'components/single_compo.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  //for google
  GoogleSignInAccount? _googleCurrentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final SharedPreferences localStorage = PreferenceUtils.instance;

  late CommonViewModel _commonViewModel;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _commonViewModel = Provider.of<CommonViewModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
        ),
        body: Consumer<CommonViewModel>(builder: (context, common, child) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(
                height: 25.sp,
              ),
              Center(
                child: Text(
                  "Story",
                  style: TextStyle(
                      color: black, fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 35.sp,
              ),
              Image.asset(
                appLogo,
                height: 200.sp,
                width: 200.sp,
              ),
              SizedBox(
                height: 130.sp,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "By signing in, you agree to out terms and ",
                      style: TextStyle(color: black)),
                  TextSpan(
                      text: "privacy policy",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url =
                              'https://pujanbohora.github.io/story-policy/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      style: TextStyle(color: Colors.blue)),
                ]),
              ),
              SizedBox(
                height: 20.sp,
              ),
              SingleCompo(
                onTap: () {
                  googleSignIn(common);
                },
                imagePath: "assets/images/bg_google.png",
                label: "SIGN IN WITH GOOGLE",
              ),
              SizedBox(
                height: 20.sp,
              ),
              SingleCompo(
                onTap: () {
                  RouteGenerator.navigateTo(routeLogin);
                },
                imagePath: "assets/images/bg_email.png",
                label: "SIGN IN WITH EMAIL",
                color: black,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "New to story?  ",
                        style: TextStyle(color: black)),
                    TextSpan(
                        text: "Register now",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            RouteGenerator.navigateTo(routeRegister);
                          },
                        style: TextStyle(color: Colors.blue)),
                  ]),
                ),
              ),
            ],
          );
        }));
  }

  Future<void> googleSignIn(CommonViewModel common) async {
    try {
      customLoadStart();
      print("part 1");
      final googleUser = await _googleSignIn.signIn();
      print("part 2 $googleUser");

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      print("part 3 $googleSignInAuthentication");
      String googleToken = googleSignInAuthentication.accessToken.toString();
      print("part 4");

      String username = googleUser.displayName ?? "";
      String profilePicture = googleUser.photoUrl ?? "";
      String email = googleUser.email ?? "";

      print("Google Token: $googleToken");

      try {
        String url =
            "https://brain.novutales.com/auth/users/login_with_sso/google/";

        http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode({"token": googleToken}),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
        );
        print("REDPONSE:::${response.body}");
        if (response.statusCode == 200) {
          Map<String, dynamic> body = jsonDecode(response.body);
          localStorage.setString("token", body["access"]);
          localStorage.setString("refresh", body["refresh"]);
          localStorage.setString("username", email);
          localStorage.setString("password", "");
          try {
            Map<String, dynamic> res = await AuthRepository().getUser();
            if (res['success'] == true && context.mounted) {
              customLoadStop();
              localStorage.setString('user', jsonEncode(res));
              // navigateTo(context: context, screen: NavigationScreen.routeName);
            } else {
              customLoadStop();
              showTopOverlayNotificationError(
                  title: "User profile could not be found");
            }
          } catch (e) {
            customLoadStop();
            print("catch in login");
            if (context.mounted) {
              showTopOverlayNotificationError(title: e.toString());
            }
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      print("ERROR:::${e.toString()}");

      customLoadStop();
      showTopOverlayNotificationError(title: "No account was selected");
    }

    customLoadStop();
  }
}
