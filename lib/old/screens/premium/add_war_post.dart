import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/location_provider.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_video_player.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/parameters/story_param.dart';
import 'package:storyv2/old/screens/premium/parameters/submission_param.dart';
import 'package:storyv2/old/screens/premium/repositories/premium_repo.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/utils/injection.dart';
import 'package:video_player/video_player.dart';

import '../../constants/app_color.dart';
import '../../constants/font_size.dart';
import '../../constants/font_weight.dart';
import '../../helper/overlay_notification.dart';
import '../../network/api_response.dart';
import '../../providers/category_view_model.dart';
import 'cusWidgets/circular_loading.dart';
import 'cusWidgets/cus_icon_button.dart';

class AddWarPost extends StatefulWidget {
  final WarModel war;
  const AddWarPost({super.key, required this.war});

  @override
  State<AddWarPost> createState() => _AddWarPostState();
}

class _AddWarPostState extends State<AddWarPost> {
  final premiumRepo = PremiumRepo();
  final titleCtr = TextEditingController();
  int category = 0;
  PickedFile? imageFile;
  PickedFile? videoFile;
  PickedFile? thumbnail;
  VideoPlayerController? videoController;
  bool thumbnailRequired = false;
  String errorMsg = "";
  bool submitting = false;
  bool playing = false;

  @override
  void dispose() {
    if (videoController != null) videoController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.pW, vertical: 30.pH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CusIconBtn(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded, color: white, size: 25),
                  ),
                  submitting
                      ? Loading()
                      : TextButton(
                          onPressed: () => submit(context),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                          ),
                          child: Text("SUBMIT",
                              style:
                                  TextStyle(color: white, fontSize: sfont_18)),
                        ),
                ],
              ),
              if (errorMsg.isNotEmpty)
                SizedBox(
                  width: double.maxFinite,
                  height: 20,
                  child: Center(
                    child: Text(
                      errorMsg,
                      style: TextStyle(
                          color: solidRed, fontSize: sfont_16, fontWeight: kW5),
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 30.pH, bottom: 15.pH),
                child: Text("Title",
                    style: TextStyle(color: white, fontSize: sfont_14)),
              ),
              TextFormField(
                controller: titleCtr,
                style: TextStyle(
                    color: white, fontSize: sfont_12, fontWeight: kW3),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter title here",
                  hintStyle: TextStyle(
                    color: white.withOpacity(.5),
                    fontSize: sfont_12,
                    fontWeight: kW3,
                  ),
                  errorBorder: getBorder(solidRed),
                  enabledBorder: getBorder(white),
                  focusedBorder: getBorder(white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.pH, bottom: 15.pH),
                child: Text(
                  "Choose Category",
                  style: TextStyle(color: white, fontSize: sfont_14),
                ),
              ),
              Consumer<CategoryViewModel>(builder: (context, model, child) {
                final categories = model.categories;
                final response = model.categoryApiResponse;

                if (response.status != Status.COMPLETED) return Loading();

                if (category == 0) category = categories.first.id!;

                return Container(
                  height: 35,
                  width: sCon.wP(.4),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<int>(
                    value: category,
                    underline: SizedBox(),
                    style: TextStyle(color: black, fontSize: sfont_14),
                    dropdownColor: white,
                    iconSize: 20,
                    iconEnabledColor: black,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    elevation: 0,
                    isExpanded: true,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    onChanged: (value) => setState(() => category = value!),
                    items: categories.map<DropdownMenuItem<int>>((e) {
                      return DropdownMenuItem(
                          value: e.id!, child: Text(e.name!));
                    }).toList(),
                  ),
                );
              }),
              Container(
                margin: EdgeInsets.only(top: 30.pH, bottom: 15.pH),
                child: Text(
                  "Choose Story",
                  style: TextStyle(color: white, fontSize: sfont_14),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Choose a picture'),
                              onTap: () {
                                _pickImage(ImageSource.gallery, "Image");
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.video_collection),
                              title: const Text('Choose a video'),
                              onTap: () {
                                _pickImage(ImageSource.gallery, "Video");
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 200.pW,
                  height: 300.pH,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: imageFile != null
                      ? ImageBuilder(
                          imageProvider: FileImage(File(imageFile!.path)),
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(10),
                        )
                      : videoFile != null
                          ? Stack(
                              children: [
                                CusVideoPlayer(
                                  controller: videoController!,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: StatefulBuilder(
                                    builder: (context, newState) {
                                      return IconButton(
                                        onPressed: () {
                                          playing
                                              ? videoController!.pause()
                                              : videoController!.play();

                                          newState(() => playing = !playing);
                                        },
                                        icon: Icon(
                                          playing
                                              ? Icons
                                                  .pause_circle_filled_rounded
                                              : Icons.play_arrow_rounded,
                                          color: white,
                                          size: 22,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : null,
                ),
              ),
              if (thumbnailRequired) ...[
                Container(
                  margin: EdgeInsets.only(top: 30.pH, bottom: 15.pH),
                  child: Text(
                    "Choose Video Thumbnail",
                    style: TextStyle(color: white, fontSize: sfont_14),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery, "Image",
                                      thumb: true);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.camera_alt_rounded),
                                title: const Text('Camera'),
                                onTap: () {
                                  _pickImage(ImageSource.camera, "Image",
                                      thumb: true);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 200.pW,
                    height: 300.pH,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: thumbnail != null
                        ? ImageBuilder(
                            imageProvider: FileImage(File(thumbnail!.path)),
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  InputBorder getBorder(Color color) =>
      UnderlineInputBorder(borderSide: BorderSide(color: color));

  Future<void> _pickImage(ImageSource source, String type,
      {bool thumb = false}) async {
    if (type == "Video") {
      final selected = await ImagePicker().pickVideo(
        source: source,
        maxDuration: const Duration(seconds: 20),
      );

      if (selected != null) {
        videoController = VideoPlayerController.file(File(selected.path));
        videoFile = PickedFile(selected.path);
        imageFile = null;
        thumbnailRequired = true;
        errorMsg = "";
        setState(() {});
      }
      return;
    }

    if (thumb) {
      final selected =
          await ImagePicker().pickImage(source: source, imageQuality: 10);
      if (selected != null) {
        thumbnail = PickedFile(selected.path);
        errorMsg = "";
        setState(() {});
      }

      return;
    }

    final selected =
        await ImagePicker().pickImage(source: source, imageQuality: 10);
    if (selected != null) {
      imageFile = PickedFile(selected.path);
      thumbnailRequired = false;
      errorMsg = "";
      videoFile = null;
      thumbnail = null;
      setState(() {});
    }
  }

  submit(BuildContext context) async {
    if (titleCtr.text.isEmpty) {
      return setState(() => errorMsg = "Title is required");
    }
    if (imageFile == null && videoFile == null) {
      return setState(() => errorMsg = "Story image or video is required");
    }
    if (videoFile != null && thumbnail == null) {
      return setState(() => errorMsg = "Video thumbnail is required");
    }

    setState(() => submitting = true);

    String mediaUrl = "";
    String thumbUrl = "";

    if (imageFile != null) {
      final cdnRes = await premiumRepo.uploadCDNFile(imageFile!.path);
      if (cdnRes.status != Status.COMPLETED) return;
      mediaUrl =
          "https://storyappcdn.b-cdn.net/${imageFile!.path.split("/").last}";
      thumbUrl =
          "https://storyappcdn.b-cdn.net/${imageFile!.path.split("/").last}";
    }

    if (videoFile != null) {
      final cdnRes = await premiumRepo.uploadCDNFile(videoFile!.path);
      if (cdnRes.status != Status.COMPLETED) return;
      mediaUrl =
          "https://storyappcdn.b-cdn.net/${imageFile!.path.split("/").last}";

      final cdnRes1 = await premiumRepo.uploadCDNFile(videoFile!.path);
      if (cdnRes1.status != Status.COMPLETED) return;
      thumbUrl =
          "https://storyappcdn.b-cdn.net/${thumbnail!.path.split("/").last}";
    }

    if (!context.mounted) return;
    final location = Provider.of<LocationProvider>(context, listen: false);

    final storyPrm = StoryPrm(
      category: category.toString(),
      title: titleCtr.text,
      mediaUrls: mediaUrl,
      latitude: location.currentLocation != null
          ? location.currentLocation!.latitude.toString()
          : 12.toString(),
      longitude: location.currentLocation != null
          ? location.currentLocation!.longitude.toString()
          : 12.toString(),
    );

    final submissionPrm = SubmissionPrm(
      story: storyPrm,
      warStory: widget.war.id,
      thumbnailUrl: thumbUrl,
    );

    final res = await premiumRepo.postSubmission(submissionPrm);

    if (res.status == Status.COMPLETED) {
      showTopOverlayNotification(title: "Story added to war");
      titleCtr.clear();
      category = 0;
      imageFile = null;
      videoFile = null;
      thumbnail = null;
      videoController = null;
      thumbnailRequired = false;
      errorMsg = "";
      playing = false;
    }

    setState(() => submitting = false);
  }
}
