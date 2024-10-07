// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tit_tit/core/constants/app_colors.dart';
// import 'package:tit_tit/core/constants/ui_constants.dart';
// import 'package:tit_tit/core/presentation/widgets/button.dart';
// import 'package:tit_tit/layers/domain/entities/my_profile_entity.dart';
// import 'package:tit_tit/layers/presentation/profile/presentation/blocs/get_my_profile/get_my_profile_bloc.dart';
// import 'package:tit_tit/layers/presentation/profile/presentation/blocs/post_profile/post_profile_bloc.dart';

// import '../../../../../core/api/api_paths.dart';
// import '../../../../../core/constants/assets.dart';
// import '../../../../../core/presentation/ui/input_models/email_input.dart';
// import '../../../../../core/presentation/ui/input_models/phone_input.dart';
// import '../../../../../core/presentation/ui/input_models/text_input.dart';
// import '../../../../../core/presentation/ui/spacer.dart';
// import '../../../../../core/presentation/ui/tits_icons_icons.dart';
// import '../../../../../core/presentation/widgets/forms/form_group.dart';
// import '../../../../../core/presentation/widgets/forms/form_input_field.dart';
// import '../widgets/profile_header.dart';

// class EditProfilePage extends StatefulWidget {
//   final MyProfileEntity profileData;
//   const EditProfilePage({super.key, required this.profileData});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   String? localImageAvatar;
//   void changeLocalImage(String value) {
//     setState(() {
//       localImageAvatar = value;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Edit Profile"),
//       ),
//       body: BlocListener<PostProfileBloc, PostProfileState>(
//         listener: (_, state) {
//           if (state.status.isSuccess) {
//             context.pop();
//             context
//                 .read<GetMyProfileBloc>()
//                 .add(const GetMyProfileEvent.attempt());
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.message ?? "")));
//           } else if (state.status.isFailure) {
//             if (state.message != null) {
//               ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: Text(state.message!)));
//             }
//           }
//         },
//         child: SingleChildScrollView(
//           physics: const ClampingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ProfileHeader(
//                 isEditable: true,
//                 avatar: widget.profileData.avatar,
//                 changeLocalImage: changeLocalImage,
//               ),
//               // UpdateCoverWidget(
//               //   avatar: widget.profileData.avatar,
//               //   changeLocalImage: changeLocalImage,
//               // ),
//               Gapper.vGap(),
//               Gapper.screenPadding(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BlocBuilder<PostProfileBloc, PostProfileState>(
//                       builder: (context, state) {
//                         return FormGroup(
//                             label: "Full Name",
//                             formField: FormInputField(
//                               initialValue: state.fullname.value,
//                               selectorLabel: "Full Name",
//                               placeholder: "",
//                               context: context,
//                               textInputType: TextInputType.text,
//                               alignment: InputAlignment.vertical,
//                               errorText: state.fullname.displayError ==
//                                       RequiredTextValidationError.empty
//                                   ? "Full name is required"
//                                   : null,
//                               onChanged: (value) {
//                                 context.read<PostProfileBloc>().add(
//                                     PostProfileEvent.validateFullName(
//                                         fullname: value));
//                               },
//                             ));
//                       },
//                     ),
//                     Gapper.vGap(),
//                     BlocBuilder<PostProfileBloc, PostProfileState>(
//                       builder: (context, state) {
//                         return FormGroup(
//                             label: "Email",
//                             formField: FormInputField(
//                               initialValue: state.email.value,
//                               selectorLabel: "Email",
//                               placeholder: "",
//                               context: context,
//                               textInputType: TextInputType.emailAddress,
//                               alignment: InputAlignment.vertical,
//                               errorText: state.email.displayError ==
//                                       EmailValidationError.empty
//                                   ? "Email is required"
//                                   : state.email.displayError ==
//                                           EmailValidationError.invalid
//                                       ? "Enter a valid email"
//                                       : null,
//                               onChanged: (value) {
//                                 context.read<PostProfileBloc>().add(
//                                     PostProfileEvent.validateEmail(
//                                         email: value));
//                               },
//                             ));
//                       },
//                     ),
//                     Gapper.vGap(),
//                     BlocBuilder<PostProfileBloc, PostProfileState>(
//                         builder: (context, state) {
//                       return FormGroup(
//                           label: "Phone",
//                           formField: FormInputField(
//                             initialValue: state.phone.value,
//                             selectorLabel: "Phone",
//                             placeholder: "",
//                             prefixText: const Text("+977"),
//                             context: context,
//                             textInputType:
//                                 const TextInputType.numberWithOptions(
//                                     signed: true),
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                             alignment: InputAlignment.vertical,
//                             errorText: state.phone.displayError ==
//                                     PhoneValidationError.empty
//                                 ? "Phone is required"
//                                 : state.phone.displayError ==
//                                         PhoneValidationError.atLeastTen
//                                     ? "Minimum 10 characters"
//                                     : null,
//                             onChanged: (value) {
//                               context.read<PostProfileBloc>().add(
//                                   PostProfileEvent.validatePhone(phone: value));
//                             },
//                           ));
//                     }),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: UIConstants.screenPadding,
//               vertical: UIConstants.screenPadding),
//           child: Row(
//             children: [
//               Expanded(
//                   child: ButtonCustom(
//                 buttonLabel: 'Cancel',
//                 alignment: MainAxisAlignment.center,
//                 textColor: Colors.black,
//                 borderColor: Colors.grey.shade500,
//               )),
//               const SizedBox(
//                 width: 8,
//               ),
//               Expanded(
//                 child: BlocBuilder<PostProfileBloc, PostProfileState>(
//                   builder: (context, state) {
//                     return ButtonCustom(
//                         buttonLabel: 'Update',
//                         isFilled: true,
//                         fillColor: AppColors.red,
//                         alignment: MainAxisAlignment.center,
//                         handleTap: () {
//                           context
//                               .read<PostProfileBloc>()
//                               .add(const PostProfileEvent.attempt());
//                         });
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class UpdateCoverWidget extends StatefulWidget {
//   final Function(String) changeLocalImage;
//   final String? avatar;
//   const UpdateCoverWidget(
//       {super.key, required this.changeLocalImage, this.avatar});

//   @override
//   State<UpdateCoverWidget> createState() => _UpdateCoverWidgetState();
// }

// class _UpdateCoverWidgetState extends State<UpdateCoverWidget> {
//   String? localImageAvatar;
//   void pickImage(ImageSource source) async {
//     try {
//       final pickedFile = await ImagePicker().pickImage(source: source);

//       if (pickedFile != null) {
//         // print("Image picked: ${pickedFile.path}");
//         setState(() {
//           localImageAvatar = pickedFile.path;
//           widget.changeLocalImage(pickedFile.path);
//         });
//       } else {
//         // print("No image selected.");
//       }
//     } catch (e) {
//       // print("Error picking image: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250,
//       child: Stack(
//         children: [
//           SizedBox(
//               height: 150,
//               width: double.maxFinite,
//               child: widget.avatar != null
//                   ? Image.network(
//                       "${ApiPaths.storageUrl}${widget.avatar!}",
//                       fit: BoxFit.cover,
//                     )
//                   : Image.asset(
//                       "assets/images/cover_image.png",
//                       fit: BoxFit.cover,
//                     )),
//           Positioned(
//             top: 100,
//             left: 12,
//             child: GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return SimpleDialog(
//                       shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(UIConstants.padding)),
//                       title: Text(
//                         "Update Profile",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyLarge
//                             ?.copyWith(fontWeight: FontWeight.bold),
//                       ),
//                       children: [
//                         SimpleDialogOption(
//                           onPressed: () {
//                             pickImage(ImageSource.camera);
//                           },
//                           child: const Text("Take a picture"),
//                         ),
//                         SimpleDialogOption(
//                           onPressed: () {
//                             pickImage(ImageSource.gallery);
//                           },
//                           child: const Text("Upload Photo"),
//                         )
//                       ],
//                     );
//                   },
//                 );
//                 // _pickImage(ImageSource.gallery);
//                 // showModalBottomSheet(
//                 //     // isDismissible: true,
//                 //     backgroundColor: Colors.white,
//                 //     shape: const RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.only(
//                 //             topLeft: Radius.circular(20),
//                 //             topRight: Radius.circular(20))),
//                 //     context: context,
//                 //     builder: (context) {
//                 //       return GalleryBottomSheet(
//                 //         pickImage: pickImage,
//                 //       );
//                 //     });
//               },
//               child: Stack(
//                 children: [
//                   Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white, width: 2),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(50))),
//                       height: 100,
//                       width: 100,
//                       child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(50)),
//                           child: localImageAvatar != null
//                               ? Image.file(
//                                   File(localImageAvatar!),
//                                   fit: BoxFit.cover,
//                                 )
//                               : widget.avatar != null
//                                   ? Image.network(
//                                       "${ApiPaths.storageUrl}${widget.avatar!}",
//                                       fit: BoxFit.cover,
//                                     )
//                                   : Image.asset(
//                                       Assets.noProfile,
//                                       fit: BoxFit.cover,
//                                     ))),
//                   Positioned(
//                     bottom: 5,
//                     right: 5,
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white, width: 2),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(15)),
//                           color: const Color(0xFF27282D)),
//                       child: const Icon(
//                         TitsIcons.profile,
//                         size: 12,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
