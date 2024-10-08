class UserFirebaseModel {
  String? name;
  String? uid;
  String? image;
  String? email;
  bool? isOnline;
  List<String>? groupId;

  UserFirebaseModel(
      {this.name,
      this.uid,
      this.image,
      this.email,
      this.isOnline,
      this.groupId});

  UserFirebaseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    image = json['image'];
    email = json['email'];
    isOnline = json['isOnline'];
    groupId = json['groupId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uid'] = uid;
    data['image'] = image;
    data['email'] = email;
    data['isOnline'] = isOnline;
    data['groupId'] = groupId;
    return data;
  }
}
