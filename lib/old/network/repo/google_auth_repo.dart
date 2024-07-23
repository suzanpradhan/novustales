import 'package:google_sign_in/google_sign_in.dart';

import '../../model/response/google_user_model.dart';

class GoogleAuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'profile',
    ],
    // clientId: Platform.isIOS
    //     ? DefaultFirebaseOptions.currentPlatform.iosClientId
    //     : null,
  );

  Future<GoogleUserModel?> signIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      String accessToken = googleSignInAuthentication.accessToken ?? "";

      return GoogleUserModel.fromModel(
        model: googleUser,
        accessToken: accessToken,
      );
    } catch (error) {
      return Future.error(error);
    }
  }

  Future signOut() async {
    await _googleSignIn.disconnect();
  }

  Future<bool> isSignedIn() async {
    bool signedIn = await _googleSignIn.isSignedIn();
    return signedIn;
  }
}
