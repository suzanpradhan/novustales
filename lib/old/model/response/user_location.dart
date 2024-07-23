// To parse this JSON data, do
//
//     final userLocation = userLocationFromJson(jsonString);

import 'dart:convert';

UserLocation userLocationFromJson(String str) => UserLocation.fromJson(json.decode(str));

String userLocationToJson(UserLocation data) => json.encode(data.toJson());

class UserLocation {
  UserLocation({
    this.name,
    this.country,
    this.state,
    this.city,
    this.county,
  });

  String? name;
  String? country;
  String? state;
  String? city;
  String? county;

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
    name: json["name"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    county: json["county"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "state": state,
    "city": city,
    "county": county,
  };
}
