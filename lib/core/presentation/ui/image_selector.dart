import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';

import '../../constants/app_colors.dart';
import '../../constants/ui_constants.dart';

class ImageSelector extends StatefulWidget {
  final String? stateImage;
  final ProfileEntity? profile;
  final Function(String)? changeLocalImage;

  const ImageSelector({
    super.key,
    this.stateImage,
    this.profile,
    this.changeLocalImage,
  });

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  Future pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        // print("Image picked: ${pickedFile.path}");
        setState(() {
          // localImageAvatar = pickedFile.path;
          if (widget.changeLocalImage != null) {
            widget.changeLocalImage!(pickedFile.path);
          }
        });
      } else {
        // print("No image selected.");
      }
    } catch (e) {
      // print("Error picking image: $e");
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    log("profile ${widget.stateImage == null || widget.stateImage!.isEmpty || widget.profile?.avatar == null}");
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage:
              widget.stateImage != null && widget.stateImage!.isNotEmpty
                  ? FileImage(File(widget.stateImage!))
                  : widget.profile?.avatar != null
                      ? NetworkImage(widget.profile!.avatar!)
                      : null,
          child: widget.stateImage == null && widget.profile?.avatar == null
              ? Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline),
                      shape: BoxShape.circle,
                      color: AppColors.taleBackground),
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    child: Text(
                      widget.profile?.firstName != null &&
                              widget.profile!.firstName.isNotEmpty
                          ? widget.profile!.firstName[0].toUpperCase()
                          : widget.profile?.email[0].toUpperCase() ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 60),
                    ),
                  ),
                )
              : null,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            radius: 14,
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(UIConstants.padding)),
                    title: Text(
                      "Update Profile",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SimpleDialogOption(
                        onPressed: () async {
                          await pickImage(ImageSource.camera).whenComplete(() {
                            context.pop();
                          });
                        },
                        child: const Text("Take a picture"),
                      ),
                      SimpleDialogOption(
                        onPressed: () async {
                          await pickImage(ImageSource.gallery).whenComplete(() {
                            context.pop();
                          });
                        },
                        child: const Text("Upload Photo"),
                      )
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black,
              ),
              child: Icon(
                Icons.photo_camera_outlined,
                size: 16,
                color: AppColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
