class StoryPrm {
  final String category;
  final String title;
  final String mediaUrls;
  final String blobRef;
  final String latitude;
  final String longitude;
  final String name;
  final String country;
  final String state;
  final String city;
  final String county;

  StoryPrm({
    required this.category,
    required this.title,
    required this.mediaUrls,
    required this.latitude,
    required this.longitude,
    this.blobRef = "",
    this.name = "",
    this.country = "",
    this.state = "",
    this.city = "",
    this.county = "",
  });

  Map<String, dynamic> toJson() => {
        "category": category,
        "title": title,
        "media_urls": mediaUrls,
        "blob_ref": blobRef,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "country": country,
        "state": state,
        "city": city,
        "county": county,
      };
}
