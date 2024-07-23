import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:storyv2/old/providers/category_view_model.dart';
import 'package:storyv2/old/screens/add_post/widgets/view_full_screen_video.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../config/api_response_config.dart';
import '../../constants/app_color.dart';
import '../../constants/cdn_url.dart';
import '../../constants/font_size.dart';
import '../../constants/font_weight.dart';
import '../../helper/overlay_notification.dart';
import '../../model/response/add_story_response.dart';
import '../../network/repo/add_story_repo.dart';
import '../../providers/auth_view_model.dart';
import '../../providers/common_view_model.dart';
import '../../providers/location_provider.dart';
import '../../providers/story_view_model.dart';

class AddStoryScreen extends StatefulWidget {
  final String assetPath;

  const AddStoryScreen({super.key, required this.assetPath});

  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  late Future<String?>? _thumbnailFuture;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String selectedCategory = "";
  String selectedCdnImagePath = "";
  bool storyLoading = false;

  late AuthViewModel _authViewModel;

  @override
  void initState() {
    super.initState();
    _thumbnailFuture = _generateThumbnail();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      // _authViewModel.fetchUserLocation();
    });
  }

  //form global key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Story"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text("Story Title",
                          //     style:
                          //         TextStyle(color: white, fontSize: sfont_14)),
                          // Container(
                          //   // width: sCon.wP(.4),
                          //   margin: const EdgeInsets.only(top: 15, bottom: 30),
                          //   child: TextFormField(
                          //     style: TextStyle(
                          //         color: white,
                          //         fontSize: sfont_12,
                          //         fontWeight: kW3),
                          //     controller: titleController,
                          //     decoration: InputDecoration(
                          //       isDense: true,
                          //       hintText: "Enter title here",
                          //       hintStyle: TextStyle(
                          //         color: white.withOpacity(.5),
                          //         fontSize: sfont_12,
                          //         fontWeight: kW3,
                          //       ),
                          //       enabledBorder: const UnderlineInputBorder(
                          //           borderSide: BorderSide(color: white)),
                          //       focusedBorder: const UnderlineInputBorder(
                          //           borderSide: BorderSide(color: white)),
                          //     ),
                          //     validator: (value) {
                          //       if (value!.isEmpty) {
                          //         return "Title is required";
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                          Text("Story Title",
                              style:
                                  TextStyle(color: white, fontSize: sfont_14)),
                          Container(
                            // width: sCon.wP(.5),
                            margin: const EdgeInsets.only(top: 20, bottom: 30),
                            child: TextFormField(
                              controller: titleController,
                              maxLength: null,
                              maxLines: 8,
                              minLines: 4,
                              textAlignVertical: TextAlignVertical.bottom,
                              style: TextStyle(
                                  color: white,
                                  fontSize: sfont_12,
                                  fontWeight: kW3),
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Enter title here",
                                hintStyle: TextStyle(
                                  color: white.withOpacity(.5),
                                  fontSize: sfont_12,
                                  fontWeight: kW3,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: white)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: white)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Title is required";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select Cover',
                              style:
                                  TextStyle(color: white, fontSize: sfont_14),
                            ),
                            const SizedBox(height: 12.0),
                            buildThumbnail(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 10),
                buildCategoryDropdown(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?>? _generateThumbnail() async {
    if (widget.assetPath.toLowerCase().endsWith('.mp4') ||
        widget.assetPath.toLowerCase().endsWith('.avi')) {
      initializePreVideo(widget.assetPath);
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: widget.assetPath,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );
      return thumbnailPath;
    } else {
      return null;
    }
  }

  void initializePreVideo(String thumbnailPath) async {
    try {
      _controller = VideoPlayerController.asset(thumbnailPath);

      _initializeVideoPlayerFuture = _controller.initialize();

      _controller.setLooping(true);
    } catch (e) {
      print(e);
    }

    setState(() {});
  }

  AssetTypes _getAssetType() {
    if (widget.assetPath.toLowerCase().endsWith('.mp4') ||
        widget.assetPath.toLowerCase().endsWith('.avi')) {
      return AssetTypes.video;
    } else {
      return AssetTypes.image;
    }
  }

  Widget buildThumbnail() {
    switch (_getAssetType()) {
      case AssetTypes.video:
        return FutureBuilder<String?>(
          future: _thumbnailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error loading thumbnail');
              }
              if (snapshot.data != null) {
                return _buildThumbnailWidget(snapshot.data!);
              } else {
                return _buildThumbnailWidget(widget.assetPath);
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      case AssetTypes.image:
      default:
        return _buildThumbnailWidget(widget.assetPath);
    }
  }

  Widget _buildThumbnailWidget(String thumbnailPath) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewFullVideoPlayerScreen(
                      videoPath: widget.assetPath,
                      controller: _controller,
                      initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
                    )));
      },
      child: Image.file(
        File(thumbnailPath),
        fit: BoxFit.contain,
        height: 180,
        width: 150,
      ),
    );
  }

  Widget buildCategoryDropdown() {
    return Consumer5<CategoryViewModel, StoryViewModel, AuthViewModel,
            LocationProvider, CommonViewModel>(
        builder: (context, categoryState, storyState, authState, locationState,
            commonState, child) {
      return isLoading(categoryState.categoryApiResponse)
          ? Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade300,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 20.0,
                width: double.infinity,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  'Category',
                  style: TextStyle(color: white, fontSize: sfont_14),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  width: double.maxFinite,
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    // color: Color(0xFFE5E5E5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFFE5E5E5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                    value: selectedCategory.isEmpty ? null : selectedCategory,
                    isDense: true,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconEnabledColor: Colors.white,
                    iconSize: 20,
                    underline: const SizedBox(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value.toString();
                        // category = value.toString();
                      });
                    },
                    dropdownColor: const Color(0xFFE5E5E5),
                    items: categoryState.categories
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10.0,
                              backgroundImage:
                                  NetworkImage(value.image.toString()),
                              backgroundColor: Colors.blue,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              value.name.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                storyLoading == false
                    ? ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (selectedCategory.isEmpty) {
                              showTopOverlayNotification(
                                  title: "Please select a category to continue",
                                  icon: Icons.error,
                                  color: Colors.red);
                              return;
                            }
                            if (widget.assetPath.isNotEmpty) {
                              // bool isSuccess = await postImageToCdn(
                              //     imageOnlyPath: imageOnlyPath,
                              //     imageOnlyName: imageOnlyName,
                              //     category: category);

                              // String allImageUrls = "https://storyapp.b-cdn.net/${imageOnlyName}";

                              // Now, postFetchImagesApi after all images have been uploaded

                              List<String> imageParts =
                                  widget.assetPath.split("/");
                              String imageName = imageParts.last;

                              setState(() => storyLoading = true);

                              await postContentToCdn(
                                  imageOnlyPath: widget.assetPath.toString(),
                                  imageOnlyName: imageName.toString(),
                                  location: locationState,
                                  auth: authState,
                                  common: commonState,
                                  story: storyState,
                                  cate: categoryState,
                                  category: selectedCategory);
                            }
                          }
                        },
                        child: const Text("Post Story"))
                    : const Center(child: CircularProgressIndicator()),
              ],
            );
    });
  }

  Future<bool> postContentToCdn(
      {required var imageOnlyPath,
      required var imageOnlyName,
      required LocationProvider location,
      required AuthViewModel auth,
      required CommonViewModel common,
      required StoryViewModel story,
      required CategoryViewModel cate,
      required String category}) async {
    Map<String, dynamic> cdnRequestFile = {
      "image": imageOnlyName.toString(),
      "ImagePath": imageOnlyPath
    };

    bool isSuccess = await AddStoryRepository().uploadCDNFile(cdnRequestFile);

    selectedCdnImagePath = "$cdnUrl$imageOnlyName";

    if (isSuccess) {
      await postCdnImagesApi(
          imageUrl: selectedCdnImagePath,
          imageOnlyPath: imageOnlyPath,
          location: location,
          auth: auth,
          story: story,
          common: common,
          snapShot: cate,
          isSuccess: isSuccess,
          category: selectedCategory);
    } else {
      setState(() => storyLoading = false);
      showTopOverlayNotification(
          title: "Failed to upload image to CDN. Please try again.",
          icon: Icons.error,
          color: Colors.red);
    }

    return isSuccess;
  }

  Future<void> postCdnImagesApi(
      {required String imageUrl,
      required LocationProvider location,
      required AuthViewModel auth,
      required var imageOnlyPath,
      required bool isSuccess,
      required StoryViewModel story,
      required CommonViewModel common,
      required CategoryViewModel snapShot,
      required String category}) async {
    Map<String, dynamic> request = {
      "title": titleController.text,
      "category": category,
      "image": imageUrl,
      "latitude": location.currentLocation != null
          ? location.currentLocation!.latitude
          : 12,
      "longitude": location.currentLocation != null
          ? location.currentLocation!.longitude
          : 12,
      "name": auth.userLocation.name.toString(),
      "state": auth.userLocation.state.toString(),
      "city": auth.userLocation.city.toString(),
      "country": auth.userLocation.country.toString(),
      "fileType": imageOnlyPath.split(".").last.toString(),
    };

    AddStoryResponse response =
        await AddStoryRepository().uploadCdnFilePathToBack(request);

    if (response.success == true && context.mounted) {
      setState(() => storyLoading = false);
      selectedCategory = "";
      titleController.clear();
      descriptionController.clear();

      Navigator.pop(context);

      showTopOverlayNotification(
        title: "Story posted successfully",
      );
    } else {
      setState(() => storyLoading = false);
      showTopOverlayNotification(
          title: "Failed to upload image to Server. Please try again.",
          icon: Icons.error,
          color: Colors.red);
    }
  }
}

enum AssetTypes {
  image,
  video,
}
