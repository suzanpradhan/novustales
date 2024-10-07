import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storyv2/core/presentation/ui/novus_icons.dart';

import '../../../../../core/api/api_paths.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/presentation/ui/spacer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/text_input.dart';
import '../../../../core/presentation/widgets/form_fields/form_group.dart';
import '../../../../core/presentation/widgets/form_fields/form_input_field.dart';
import '../../../../core/presentation/widgets/simple_button.dart';
import '../../../../utils/dependencies_injection.dart';
import '../../../domain/entities/profile_entity.dart';
import '../bloc/profile_bloc/get_profile_bloc.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';

class UpdateProfileScreen extends StatefulWidget {
  final ProfileEntity profileData;
  const UpdateProfileScreen({super.key, required this.profileData});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String? localImageAvatar;
  void changeLocalImage(String value) {
    setState(() {
      localImageAvatar = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileBloc(
          currentProfileData: widget.profileData, updateProfile: sl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
        ),
        body: BlocListener<UpdateProfileBloc, UpdateProfileState>(
          listener: (_, state) {
            if (state.status.isSuccess) {
              context.pop();
              context
                  .read<GetProfileBloc>()
                  .add(const GetProfileEvent.request());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message ?? "")));
            } else if (state.status.isFailure) {
              if (state.message != null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            }
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ProfileHeader(
                //   isEditable: true,
                //   avatar: widget.profileData.avatar,
                //   changeLocalImage: changeLocalImage,
                // ),
                Gapper.vGap(),
                Gapper.screenPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                        builder: (context, state) {
                          return FormGroup(
                              label: Text("First Name"),
                              formField: FormInputField(
                                initialValue: state.firstName.value,
                                selectorLabel: "First Name",
                                placeholder: "",
                                context: context,
                                textInputType: TextInputType.text,
                                alignment: InputAlignment.vertical,
                                errorText: state.firstName.displayError ==
                                        RequiredTextValidationError.empty
                                    ? "First name is required"
                                    : null,
                                onChanged: (value) {
                                  context.read<UpdateProfileBloc>().add(
                                      UpdateProfileEvent.validateFirstName(
                                          firstName: value));
                                },
                              ));
                        },
                      ),
                      Gapper.vGap(),
                      BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                        builder: (context, state) {
                          return FormGroup(
                              label: Text("Last Name"),
                              formField: FormInputField(
                                initialValue: state.lastName.value,
                                selectorLabel: "Last Name",
                                placeholder: "",
                                context: context,
                                textInputType: TextInputType.text,
                                alignment: InputAlignment.vertical,
                                errorText: state.lastName.displayError ==
                                        RequiredTextValidationError.empty
                                    ? "Last name is required"
                                    : null,
                                onChanged: (value) {
                                  context.read<UpdateProfileBloc>().add(
                                      UpdateProfileEvent.validateLastName(
                                          lastName: value));
                                },
                              ));
                        },
                      ),
                      Gapper.vGap(),
                      BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                          builder: (context, state) {
                        return FormGroup(
                            label: Text("Bio"),
                            formField: FormInputField(
                              initialValue: state.bio.value,
                              selectorLabel: "Bio",
                              placeholder: "",
                              prefixText: const Text("Write your bio here"),
                              context: context,
                              textInputType:
                                  const TextInputType.numberWithOptions(
                                      signed: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              alignment: InputAlignment.vertical,
                              errorText: state.bio.displayError ==
                                      RequiredTextValidationError.empty
                                  ? "Bio is required"
                                  : null,
                              onChanged: (value) {
                                context.read<UpdateProfileBloc>().add(
                                    UpdateProfileEvent.validateBio(bio: value));
                              },
                            ));
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.screenPadding,
                vertical: UIConstants.screenPadding),
            child: Row(
              children: [
                Expanded(
                    child: SimpleButton(
                  buttonLabel: 'Cancel',
                  alignment: MainAxisAlignment.center,
                  textColor: Colors.black,
                  borderColor: Colors.grey.shade500,
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                    builder: (context, state) {
                      return SimpleButton(
                          buttonLabel: 'Update',
                          isFilled: true,
                          fillColor: AppColors.purpleAccent,
                          alignment: MainAxisAlignment.center,
                          handleTap: () {
                            context
                                .read<UpdateProfileBloc>()
                                .add(const UpdateProfileEvent.attempt());
                          });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateCoverWidget extends StatefulWidget {
  final Function(String) changeLocalImage;
  final String? avatar;
  const UpdateCoverWidget(
      {super.key, required this.changeLocalImage, this.avatar});

  @override
  State<UpdateCoverWidget> createState() => _UpdateCoverWidgetState();
}

class _UpdateCoverWidgetState extends State<UpdateCoverWidget> {
  String? localImageAvatar;
  void pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        // print("Image picked: ${pickedFile.path}");
        setState(() {
          localImageAvatar = pickedFile.path;
          widget.changeLocalImage(pickedFile.path);
        });
      } else {
        // print("No image selected.");
      }
    } catch (e) {
      // print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          SizedBox(
              height: 150,
              width: double.maxFinite,
              child: widget.avatar != null
                  ? Image.network(
                      "${ApiPaths.storageUrl}${widget.avatar!}",
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/cover_image.png",
                      fit: BoxFit.cover,
                    )),
          Positioned(
            top: 100,
            left: 12,
            child: GestureDetector(
              onTap: () {
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
                          onPressed: () {
                            pickImage(ImageSource.camera);
                          },
                          child: const Text("Take a picture"),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                          },
                          child: const Text("Upload Photo"),
                        )
                      ],
                    );
                  },
                );
                // _pickImage(ImageSource.gallery);
                // showModalBottomSheet(
                //     // isDismissible: true,
                //     backgroundColor: Colors.white,
                //     shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(20),
                //             topRight: Radius.circular(20))),
                //     context: context,
                //     builder: (context) {
                //       return GalleryBottomSheet(
                //         pickImage: pickImage,
                //       );
                //     });
              },
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: localImageAvatar != null
                              ? Image.file(
                                  File(localImageAvatar!),
                                  fit: BoxFit.cover,
                                )
                              : widget.avatar != null
                                  ? Image.network(
                                      "${ApiPaths.storageUrl}${widget.avatar!}",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      Assets.noProfile,
                                      fit: BoxFit.cover,
                                    ))),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: const Color(0xFF27282D)),
                      child: const Icon(
                        NovusIcons.profile,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
