import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:jaamna/config/environment_config.dart';
// import 'package:jaamna/constants/api_end_points.dart';
// import 'package:jaamna/route/route_name.dart';
// import 'package:jaamna/route/router_generator.dart';
// import 'package:jaamna/screens/login_signup/signup.dart';
import 'package:uni_links/uni_links.dart';

class FirebaseDynamicLinkService {
  final dynamicLink = FirebaseDynamicLinks.instance;

  handleDynamicLink() async {
    print('HANLDE LINK SERVICE STARTED');
    String? initialLink = await getInitialLink();
    print("This is initial link::::${initialLink}");
    if (initialLink != null) {
      FirebaseDynamicLinks.instance
          .getDynamicLink(Uri.parse(initialLink.toString()))
          .then((value) {
        if (value != null) {
          // print(value.link.queryParameters.toString());
          var isRefer = value.link.pathSegments.contains('sign-up');
          if (isRefer) {
            // print(value.link.query);

            var code = value.link.queryParameters['referal_code'];

            if (code != null) {
              // EnvironmentConfig.ref = code;
              // RouteGenerator.navigateTo(
              //   routeSignUp,
              //   args: EnvironmentConfig.ref,
              // );
            }
          }
        }
        return null;
      });
    }
  }

  static Future<String> createReferralLink(
      bool short, String referralCode) async {
    print('CREATE SERVICE STARTED');
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
        uriPrefix: 'https://viewstory.page.link/',
        link: Uri.parse('https://brain.novutales.com/'),
        androidParameters: const AndroidParameters(
          packageName: 'com.story.social.np',
        ),
        socialMetaTagParameters:
            const SocialMetaTagParameters(title: 'Share', description: 'Share'),
        navigationInfoParameters:
            const NavigationInfoParameters(forcedRedirectEnabled: true));

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParameters);
      url = shortLink.shortUrl;
    } else {
      url =
          await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParameters);
    }

    return url.toString();
  }

  void handleSuccessLinking(PendingDynamicLinkData data) {
    // print('DYNAMIC SERVICE IF SUCESS SERVICE STARTED');
    final Uri deepLink = data.link;

    // print(deepLink.queryParameters.toString());
    var isRefer = deepLink.pathSegments.contains('sign-up');
    if (isRefer) {
      // print('i am here' + deepLink.toString());
      var code = deepLink.queryParameters['referal_code'];
      // EnvironmentConfig.ref = code;
      // print(code.toString());
      // if (code != null) {
      //   // print('i am herew' + code.toString());
      //
      //   RouteGenerator.navigateTo(
      //     routeSignUp,
      //     args: EnvironmentConfig.ref,
      //   );
      // }
    }
  }
}
