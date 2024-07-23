class CBattlePrm {
  final List<int> moderators;
  final String title;
  final String description;
  final String thumbnailUrl;
  final bool private;
  final String type;
  final int category;
  final DateTime deadline;

  const CBattlePrm({
    required this.moderators,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.private,
    required this.type,
    required this.category,
    required this.deadline,
  });

  Map<String, dynamic> toJson() => {
        "moderators": moderators,
        "title": title,
        "description": description,
        "thumbnail_url": thumbnailUrl,
        "is_private": private,
        "type": type,
        "category": category,
        "deadline": deadline.toIso8601String(),
      };
}
