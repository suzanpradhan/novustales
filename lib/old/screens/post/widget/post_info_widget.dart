import 'dart:io';

import 'package:camera/camera.dart' hide ImageFormat;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/model/response/single_category_response.dart';
import 'package:storyv2/old/network/repo/auth_repo.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../config/api_response_config.dart';
import '../../../constants/app_color.dart';
import '../../../constants/cdn_url.dart';
import '../../../constants/text_style.dart';
import '../../../model/response/add_story_response.dart';
import '../../../network/repo/story_repo.dart';
import '../../../providers/auth_view_model.dart';
import '../../../providers/category_view_model.dart';
import '../../../providers/common_view_model.dart';
import '../../../providers/location_provider.dart';
import '../../../providers/story_view_model.dart';
import '../../../widgets/vertical_loader.dart';
import 'continue_button.dart';

class PostInfo extends StatefulWidget {
  final XFile path;
  final List<XFile>? selectImages;

  const PostInfo({
    super.key,
    required this.path,
    required this.selectImages,
  });

  @override
  _PostInfoState createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  late File thumbnailFile;
  bool uploading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  String category = "";
  bool dropdownError = false;
  String selectedCategory = "";

  List<String> listOfCdnImages = [];

  @override
  void initState() {
    super.initState();
    generateThumbnail();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer5<CategoryViewModel, StoryViewModel, AuthViewModel,
        LocationProvider, CommonViewModel>(
      builder: (context, snapShot, story, auth, location, common, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Post", style: TextStyle(color: Colors.black)),
            centerTitle: true,
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView(
                  physics: ScrollPhysics(),
                  children: <Widget>[
                    buildUserInfo(auth),
                    isLoading(story.allCategoryApiResponse)
                        ? VerticalLoader(count: 1)
                        : story.allCategory.results == null ||
                                story.allCategory.results!.isEmpty
                            ? Text("No Category Found")
                            : buildCategoryDropdown(snapShot, story),
                    Text(
                      'Select Cover \n',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    // buildSelectedImages(),
                    // widget.path.path == null || widget.path.path == ""
                    //     ? SizedBox()
                    //     : Builder(builder: (context) {
                    //         return buildThumbnail();
                    //       }),
                    SizedBox(height: 12.0),
                    isLoadingOnly(auth.userLocationApiResponse) || uploading
                        ? Center(child: CircularProgressIndicator())
                        : ContinueButton(
                            text: "Post Story",
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) return;

                              if (category.isEmpty) {
                                showTopOverlayNotificationError(
                                    title: "Please select a category");
                              }

                              try {
                                setState(() => uploading = true);

                                String imageOnlyName;
                                String imageOnlyPath = "s";
                                listOfCdnImages.clear();

                                if (widget.selectImages == null ||
                                    widget.selectImages!.isEmpty) {
                                  imageOnlyName = widget.path.name.toString();
                                  imageOnlyPath = widget.path.path.toString();

                                  bool isSuccess = await postImageToCdn(
                                      imageOnlyPath: imageOnlyPath,
                                      imageOnlyName: imageOnlyName,
                                      category: category);

                                  String allImageUrls = "$cdnUrl$imageOnlyName";

                                  // Now, postFetchImagesApi after all images have been uploaded
                                  await postFetchImagesApi(
                                    imageUrl: allImageUrls,
                                    location: location,
                                    auth: auth,
                                    imageOnlyPath: imageOnlyPath,
                                    common: common,
                                    story: story,
                                    snapShot: snapShot,
                                    isSuccess: isSuccess,
                                    category: category,
                                  );
                                } else {
                                  print(
                                      "YOUR ARE IN ELSE:::${widget.selectImages}");
                                  List<XFile> images =
                                      widget.selectImages ?? [];

                                  List<bool> uploadResults = [];

                                  await Future.wait(images.map((e) async {
                                    print("NAME FO FILE::${e.name}");
                                    imageOnlyName = e.name.toString();
                                    imageOnlyPath = e.path.toString();

                                    String cdnImageUrl =
                                        "$cdnUrl$imageOnlyName";

                                    listOfCdnImages.add(cdnImageUrl);

                                    bool result = await postImageToCdn(
                                      imageOnlyPath: imageOnlyPath,
                                      imageOnlyName: imageOnlyName,
                                      category: category,
                                    );

                                    uploadResults.add(result);
                                  }));

                                  await Future.delayed(Duration(seconds: 1));

                                  bool allUploadsSuccessful =
                                      uploadResults.every((result) => result);

                                  if (allUploadsSuccessful) {
                                    String allImageUrls =
                                        listOfCdnImages.join("\n");

                                    print("All Image URLs: $allImageUrls");

                                    await postFetchImagesApi(
                                      imageUrl: allImageUrls,
                                      location: location,
                                      auth: auth,
                                      imageOnlyPath: imageOnlyPath,
                                      common: common,
                                      story: story,
                                      snapShot: snapShot,
                                      isSuccess: allUploadsSuccessful,
                                      category: category,
                                    );
                                  } else {
                                    setState(() => uploading = false);
                                    showTopOverlayNotificationError(
                                        title: "Images failed to upload.");
                                  }
                                }
                              } catch (e) {
                                print(e.toString());
                                setState(() => uploading = false);
                                showTopOverlayNotificationError(
                                    title: e.toString());
                              } finally {
                                setState(() => uploading = false);
                              }
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> generateThumbnail() async {
    Directory tempDir = await getTemporaryDirectory();

    if (widget.path.path.toLowerCase().endsWith('.mp4') ||
        widget.path.path.toLowerCase().endsWith('.avi')) {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: widget.path.path,
        thumbnailPath: widget.path.path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );

      setState(() {
        thumbnailFile = File(fileName.toString());
      });
    } else {
      setState(() {
        thumbnailFile = File(widget.path.path);
      });
    }
  }

  Widget buildThumbnail() {
    return Image.file(
      thumbnailFile,
      fit: BoxFit.contain,
      height: 100,
      width: 200,
    );
  }

  Widget buildUserInfo(AuthViewModel auth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 24,
            backgroundImage: Image.network(
              auth.userData['avatar'].toString(),
              fit: BoxFit.cover,
            ).image,
          ),
        ),
        Expanded(
          flex: 6,
          child: TextFormField(
            controller: titleController,
            enableSuggestions: false,
            keyboardType: TextInputType.multiline,
            minLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter title';
              }
              return null;
            },
            maxLength: null,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              hintStyle: bR16W3,
              fillColor: Colors.transparent,
              hintText: "Describe your story",
              focusColor: black,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategoryDropdown(
      CategoryViewModel snapShot, StoryViewModel story) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Text(
          'Category',
          style: TextStyle(
            color: Color(0xFF204051),
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.maxFinite,
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: dropdownError ? Colors.red : Color(0xFFE5E5E5),
            ),
          ),
          alignment: Alignment.center,
          child: DropdownButton<String>(
            value: selectedCategory.isEmpty ? null : selectedCategory,
            isDense: true,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            iconEnabledColor: Colors.black,
            iconSize: 20,
            underline: SizedBox(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value.toString();
                category = value.toString();
              });
            },
            dropdownColor: Color(0xFFE5E5E5),
            items: story.allCategory.results!
                .map<DropdownMenuItem<String>>((Result value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10.0,
                      backgroundImage: NetworkImage(value.image.toString()),
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      value.name!,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        if (dropdownError)
          Padding(
            padding: EdgeInsets.only(top: 8, left: 10),
            child: Row(
              children: const [
                Text(
                  "Dropdown not selected",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Future<void> postFetchImagesApi(
      {required String imageUrl,
      required LocationProvider location,
      required AuthViewModel auth,
      required var imageOnlyPath,
      required bool isSuccess,
      required StoryViewModel story,
      required CommonViewModel common,
      required CategoryViewModel snapShot,
      required String category}) async {
    if (isSuccess) {
      print("CDN IMAGE ARE ::::$imageUrl");
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
          await AuthRepository().postSingleStoryTest(request);
      setState(() => uploading = false);
      //
      if (response.success == true && context.mounted) {
        // selectedCategory = "";
        // story.fetchTrendingStoryAccToCat(
        //     "/api/story/get_story_by_category/?category=${story.allCategory.results!.first.name.toString()}");
        common.itemTapped(0);
        // story.fetchTrendingCategoryList();
        Navigator.pop(context);
        // if (widget.path != null &&
        //     widget.path != "") {
        //   Navigator.pop(context);
        // }
        if (widget.selectImages != null && widget.selectImages!.isNotEmpty) {
          widget.selectImages!.clear();
        }
        titleController.clear();
        showTopOverlayNotification(title: "Success");
      } else {
        showTopOverlayNotification(title: "Failed");
      }
    } else {
      setState(() => uploading = false);
      showTopOverlayNotification(title: "Failed");
    }
  }

  Future<bool> postImageToCdn(
      {required var imageOnlyPath,
      required var imageOnlyName,
      required String category}) async {
    Map<String, dynamic> cdnRequestFile = {
      "category": category,
      "image": imageOnlyName.toString(),
      "fileType": imageOnlyPath.split(".").last.toString(),
      "ImagePath": imageOnlyPath
    };

    bool isSuccess = await StoryRepo().uploadCDNFile(cdnRequestFile);

    print("RESPONSE:::$isSuccess");

    return isSuccess;
  }
}
