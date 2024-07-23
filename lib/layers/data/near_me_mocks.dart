import 'package:latlong2/latlong.dart';

enum MediaType { profile, image, video }

class NearMeItem {
  final LatLng latLng;
  final String title;
  final String thumbnail;
  final MediaType mediaType;

  const NearMeItem(
      {required this.latLng,
      required this.mediaType,
      required this.thumbnail,
      required this.title});
}

const nearMeMockedItems = [
  NearMeItem(
      latLng: LatLng(27.711992, 85.345046),
      mediaType: MediaType.image,
      thumbnail:
          "https://images.unsplash.com/photo-1526512340740-9217d0159da9?fm=jpg&w=1000",
      title: "Ethan Roberts"),
  NearMeItem(
      latLng: LatLng(27.711042, 85.342851),
      mediaType: MediaType.image,
      thumbnail:
          "https://images.unsplash.com/photo-1506998785328-81e7bb5003e4?q=80&w=1000",
      title: "Ava Morris"),
  NearMeItem(
      latLng: LatLng(27.710371, 85.344396),
      mediaType: MediaType.image,
      thumbnail:
          "https://images.unsplash.com/photo-1601208443688-c71856b84610?q=80&w=1000",
      title: "Olivia Bennett"),
  NearMeItem(
      latLng: LatLng(27.707778, 85.343553),
      mediaType: MediaType.image,
      thumbnail:
          "https://images.unsplash.com/photo-1595831004082-7d028af1387b?q=80&w=1000",
      title: "Olivia Bennett"),
  NearMeItem(
      latLng: LatLng(27.709721, 85.341727),
      mediaType: MediaType.profile,
      thumbnail:
          "https://images.unsplash.com/photo-1544723795-3fb6469f5b39?q=80&w=100",
      title: "Mason Scott"),
  NearMeItem(
      latLng: LatLng(27.708605, 85.346948),
      mediaType: MediaType.profile,
      thumbnail:
          "https://images.unsplash.com/photo-1549068106-b024baf5062d?q=80&w=100",
      title: "Jordan Lee")
];
