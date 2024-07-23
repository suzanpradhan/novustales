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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uid'] = this.uid;
    data['image'] = this.image;
    data['email'] = this.email;
    data['isOnline'] = this.isOnline;
    data['groupId'] = this.groupId;
    return data;
  }
}
