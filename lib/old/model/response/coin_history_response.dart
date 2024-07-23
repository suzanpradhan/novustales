// To parse this JSON data, do
//
//     final coinHistoryResponse = coinHistoryResponseFromJson(jsonString);

import 'dart:convert';

CoinHistoryResponse coinHistoryResponseFromJson(String str) => CoinHistoryResponse.fromJson(json.decode(str));

String coinHistoryResponseToJson(CoinHistoryResponse data) => json.encode(data.toJson());

class CoinHistoryResponse {
  int? id;
  UserDetails? userDetails;
  List<CoinHistory>? coinHistory;
  int? quantity;
  int? user;

  CoinHistoryResponse({
    this.id,
    this.userDetails,
    this.coinHistory,
    this.quantity,
    this.user,
  });

  factory CoinHistoryResponse.fromJson(Map<String, dynamic> json) => CoinHistoryResponse(
    id: json["id"],
    userDetails: UserDetails.fromJson(json["user_details"]),
    coinHistory: List<CoinHistory>.from(json["coin_history"].map((x) => CoinHistory.fromJson(x))),
    quantity: json["quantity"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_details": userDetails?.toJson(),
    "coin_history": List<dynamic>.from(coinHistory!.map((x) => x.toJson())),
    "quantity": quantity,
    "user": user,
  };
}

class CoinHistory {
  int? id;
  int? quantity;
  String? reason;
  dynamic description;
  DateTime? createdAt;
  int? coin;
  int? toUser;
  int? fromUser;

  CoinHistory({
    this.id,
    this.quantity,
    this.reason,
    this.description,
    this.createdAt,
    this.coin,
    this.toUser,
    this.fromUser,
  });

  factory CoinHistory.fromJson(Map<String, dynamic> json) => CoinHistory(
    id: json["id"],
    quantity: json["quantity"],
    reason: json["reason"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    coin: json["coin"],
    toUser: json["to_user"],
    fromUser: json["from_user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "reason": reason,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "coin": coin,
    "to_user": toUser,
    "from_user": fromUser,
  };
}

class UserDetails {
  int? id;
  String? email;
  String? name;
  String? nickName;
  String? avatar;

  UserDetails({
    this.id,
    this.email,
    this.name,
    this.nickName,
    this.avatar,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
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
