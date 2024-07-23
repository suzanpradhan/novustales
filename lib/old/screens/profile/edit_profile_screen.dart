import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/helper/custom_loader.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/widgets/custom_button.dart';
import '../../config/preference_utils.dart';
import '../../constants/app_color.dart';
import '../../constants/text_style.dart';
import '../../providers/auth_view_model.dart';
import '../../widgets/custom_decoration.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "/edit-profile";
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final SharedPreferences localStorage = PreferenceUtils.instance;
  TextEditingController fNC = TextEditingController();
  TextEditingController lNC = TextEditingController();
  TextEditingController nNC = TextEditingController();
  TextEditingController bC = TextEditingController();
  late AuthViewModel _authViewModel;

  String _profile = "";
  String _token = "";
  File? imageFile;
  bool updating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      fNC.text = _authViewModel.userData["first_name"] ?? "";
      lNC.text = _authViewModel.userData["last_name"] ?? "";
      nNC.text = _authViewModel.userData["nick_name"] ?? "";
      _profile = _authViewModel.userData["avatar"] ?? "";
    });
  }

  TextStyle? getCustomTextStyle() {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, auth, child) {
      return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: globalPadding,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 2,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF204051),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  // automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  title: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                imageFile == null
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            auth.userData['avatar'].toString()),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage: FileImage(imageFile!),
                                      ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () => _showPicker(),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: white,
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "First Name",
                          style: getCustomTextStyle(),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: fNC,
                            onChanged: (value) {},
                            enableSuggestions: false,
                            keyboardType: TextInputType.text,
                            decoration: customDecoration(
                                "", const Icon(Icons.edit), true),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Last Name",
                          style: getCustomTextStyle(),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: lNC,
                            onChanged: (value) {},
                            enableSuggestions: false,
                            keyboardType: TextInputType.text,
                            decoration: customDecoration(
                                "", const Icon(Icons.edit), true),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Nick Name",
                          style: getCustomTextStyle(),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: nNC,
                            onChanged: (value) {},
                            enableSuggestions: false,
                            keyboardType: TextInputType.text,
                            decoration: customDecoration(
                                "", const Icon(Icons.edit), true),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Text(
                        //   "Bio",
                        //   style: TextStyle(color: black, fontWeight: kW5),
                        // ),
                        // Container(
                        //     margin: const EdgeInsets.symmetric(vertical: 10),
                        //     child: TextFormField(
                        //       controller: bC,
                        //       onChanged: (value) {},
                        //       enableSuggestions: false,
                        //       maxLines: 5,
                        //       keyboardType: TextInputType.text,
                        //       decoration: customDecoration(
                        //           "Write something about yourself...",
                        //           SizedBox(),
                        //           true),
                        //       style: const TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 16,
                        //       ),
                        //     ))
                      ],
                    )),
                const SizedBox(
                  height: 40,
                ),
                updating
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kSecondaryColor,
                          strokeWidth: 2,
                        ),
                      )
                    : CustomButton(
                        buttonName: "Update",
                        onTap: updateProfile,
                        containerColor: kSecondaryColor,
                      ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
          ),
        ),
      );
    });
  }

  Future<void> updateProfile() async {
    _token = localStorage.getString("token") ?? "";

    setState(() => updating = true);

    final request = MultipartRequest(
      "PATCH",
      Uri.parse("https://brain.novutales.com/auth/users/me/"),
    );

    request.headers.addAll({
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });

    if (fNC.text.isNotEmpty) {
      request.fields.addAll({
        "first_name": fNC.text,
      });
    }

    if (lNC.text.isNotEmpty) {
      request.fields.addAll({
        "last_name": lNC.text,
      });
    }

    if (nNC.text.isNotEmpty) {
      request.fields.addAll({
        "nick_name": nNC.text,
      });
    }

    if (imageFile != null) {
      request.files.add(
        MultipartFile(
          "avatar",
          File(imageFile!.path).readAsBytes().asStream(),
          File(imageFile!.path).lengthSync(),
          filename: imageFile!.path.split("/").last,
          contentType: MediaType(
            "image",
            "png",
          ),
        ),
      );
    }

    final response = await request.send();
    final resString = await response.stream.bytesToString();

    setState(() => updating = false);

    Map<String, dynamic> resBody = jsonDecode(resString);

    bool success = response.statusCode == 200 && resBody.containsKey("email");

    if (success && context.mounted) {
      setState(() => _profile = resBody["avatar"]);

      final provider = Provider.of<AuthViewModel>(context, listen: false);
      await provider.fetchUser();

      showTopOverlayNotification(title: "Profile updated");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? xFile = await ImagePicker().pickImage(source: source);

    if (xFile != null) {
      setState(() {
        imageFile = File(xFile.path);
      });
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
