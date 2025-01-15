import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/presentation/widgets/image_widget.dart';
import '../../../../core/constants/ui_constants.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.21;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class ProfileHeader extends StatefulWidget {
  final String? avatar;
  final bool isEditable;
  final Function(String)? changeLocalImage;
  const ProfileHeader({
    super.key,
    this.avatar,
    this.isEditable = false,
    this.changeLocalImage,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  String? localImageAvatar;
  Future pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        // print("Image picked: ${pickedFile.path}");
        setState(() {
          localImageAvatar = pickedFile.path;
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
    return Stack(
      children: [
        SizedBox(
          height: 140,
          width: MediaQuery.of(context).size.width,
          child: const ImageWidget(
            hasShimmer: true,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -20,
          child: SizedBox(
            height: 65,
            child: CustomPaint(
              painter:
                  NavCustomPainter(0, 3, AppColors.white, TextDirection.ltr),
              child: Container(
                height: 80,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: Row(
            children: [
              Expanded(
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    if (widget.isEditable && widget.changeLocalImage != null) {
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
                                  await pickImage(ImageSource.camera)
                                      .whenComplete(() {
                                    context.pop();
                                  });
                                },
                                child: const Text("Take a picture"),
                              ),
                              SimpleDialogOption(
                                onPressed: () async {
                                  await pickImage(ImageSource.gallery)
                                      .whenComplete(() {
                                    context.pop();
                                  });
                                },
                                child: const Text("Upload Photo"),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 65,
                        height: 65,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                            child: localImageAvatar != null
                                ? Image.file(
                                    File(localImageAvatar!),
                                    fit: BoxFit.cover,
                                  )
                                : ImageWidget(
                                    imageUrl: widget.avatar,
                                    placeholderColor: AppColors.white,
                                    placeholder: (widget.avatar == null ||
                                            widget.avatar!.isEmpty)
                                        ? Image.asset(
                                            Assets.noProfile,
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  )),
                      ),
                      if (widget.isEditable)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      UIConstants.maxBordeRadius)),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 16,
                              )),
                        )
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileHeaderShimmer extends StatelessWidget {
  const ProfileHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.whiteShade.withOpacity(0.5),
          highlightColor: AppColors.whiteShade,
          child: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: const ImageWidget(
              hasShimmer: true,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -20,
          child: SizedBox(
            height: 65,
            child: CustomPaint(
              painter:
                  NavCustomPainter(0, 3, AppColors.white, TextDirection.ltr),
              child: Container(
                height: 80,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: Row(
            children: [
              Expanded(
                child: Center(
                    child: SizedBox(
                  width: 65,
                  height: 65,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: ImageWidget(
                        hasShimmer: true,
                        placeholderColor: AppColors.white,
                      )),
                )),
              ),
              Expanded(child: SizedBox()),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
