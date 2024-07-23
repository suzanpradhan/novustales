class UserDetailModel {
  final int id;
  final String email;
  final String name;
  final String nickName;
  final String avatar;

  UserDetailModel({
    required this.id,
    required this.email,
    required this.name,
    required this.nickName,
    required this.avatar,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) => UserDetailModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        nickName: json["nick_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "nick_name": nickName,
        "avatar": avatar,
      };
}
