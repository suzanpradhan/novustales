class SUserModel {
  final int id;
  final String nickName;
  final String avatar;
  final String firstName;
  final String lastName;

 const SUserModel({
    required this.id,
    required this.nickName,
    required this.avatar,
    required this.firstName,
    required this.lastName,
  });

  factory SUserModel.fromJson(Map<String, dynamic> json) => SUserModel(
        id: json["id"],
        nickName: json["nick_name"],
        avatar: json["avatar"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nick_name": nickName,
        "avatar": avatar,
        "first_name": firstName,
        "last_name": lastName,
      };
}
