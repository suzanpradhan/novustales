// To parse this JSON data, do
//
//     final graphResponse = graphResponseFromJson(jsonString);

import 'dart:convert';

List<GraphResponse> graphResponseFromJson(String str) => List<GraphResponse>.from(json.decode(str).map((x) => GraphResponse.fromJson(x)));

String graphResponseToJson(List<GraphResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GraphResponse {
  DateTime? date;
  num? quantity;

  GraphResponse({
    this.date,
    this.quantity,
  });

  factory GraphResponse.fromJson(Map<String, dynamic> json) => GraphResponse(
    date: DateTime.parse(json["date"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "quantity": quantity,
  };
}
