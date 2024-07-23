import 'package:storyv2/old/screens/premium/models/searched_user_model.dart';

import 'submission_model.dart';

class WarModel {
  final int id;
  final SUserModel createdBy;
  final String categoryName;
  final int totalViews;
  final String title;
  final String description;
  final bool isPrivate;
  final String type;
  final String thumbnailUrl;
  final List<SubmissionModel> submissions;

  WarModel({
    required this.id,
    required this.createdBy,
    required this.categoryName,
    required this.totalViews,
    required this.title,
    required this.description,
    required this.isPrivate,
    required this.type,
    required this.thumbnailUrl,
    required this.submissions,
  });

  factory WarModel.fromJson(Map<String, dynamic> json) => WarModel(
        id: json["id"],
        createdBy: SUserModel.fromJson(json["created_by"]),
        categoryName: json["category_name"],
        totalViews: json["total_views"] ?? 0,
        title: json["title"],
        description: json["description"] ?? "",
        isPrivate: json["is_private"] ?? false,
        type: json["type"] ?? "community",
        thumbnailUrl: json["thumbnail_url"] ?? "",
        submissions: json["submissions"] == null
            ? []
            : (json["submissions"] as List)
                .map((e) => SubmissionModel.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy.toJson(),
        "category_name": categoryName,
        "total_views": totalViews,
        "title": title,
        "description": description,
        "is_private": isPrivate,
        "type": type,
        "thumbnail_url": thumbnailUrl,
        "submissions": submissions,
      };

  WarModel addSubmissions(List<SubmissionModel> newSubmissions) => WarModel(
        id: id,
        createdBy: createdBy,
        categoryName: categoryName,
        totalViews: totalViews,
        title: title,
        description: description,
        isPrivate: isPrivate,
        type: type,
        thumbnailUrl: thumbnailUrl,
        submissions: newSubmissions,
      );
}
