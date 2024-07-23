import 'package:google_sign_in/google_sign_in.dart';

class GoogleUserModel {
  final String id;
  final String name;
  final String email;
  final String image;
  final String serverAuthCode;
  final String accessToken;

  const GoogleUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.serverAuthCode,
    required this.accessToken,
  });

  factory GoogleUserModel.fromModel({
    required GoogleSignInAccount model,
    required String accessToken,
  }) =>
      GoogleUserModel(
        id: model.id,
        name: model.displayName ?? "",
        email: model.email,
        image: model.photoUrl ?? "",
        serverAuthCode: model.serverAuthCode ?? "",
        accessToken: accessToken,
      );

  Map<String, String> toJson() => {
    "provider": "google",
    "email": email,
    "name": name,
    "google_id": id,
    "access_provider_token": accessToken,
  };

  @override
  String toString() {
    return "GoogleUserModel(id: $id, name: $name, email: $email, image: $image, serverAuthCode: $serverAuthCode, accessToken: $accessToken)";
  }
}
