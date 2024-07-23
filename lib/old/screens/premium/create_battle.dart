import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/category_view_model.dart';
import '../../constants/app_color.dart';
import '../../constants/font_size.dart';
import '../../constants/font_weight.dart';
import '../../helper/overlay_notification.dart';
import '../../network/api_response.dart';
import 'models/searched_user_model.dart';
import 'parameters/create_battle_param.dart';
import 'repositories/premium_repo.dart';
import 'utils/int_extension.dart';
import 'utils/injection.dart';
import 'cusWidgets/circular_loading.dart';
import 'cusWidgets/cus_icon_button.dart';
import 'cusWidgets/image_builder.dart';

import 'widget/user_selection.dart';

class CreateBattle extends StatefulWidget {
  const CreateBattle({super.key});

  @override
  State<CreateBattle> createState() => _CreateBattleState();
}

class _CreateBattleState extends State<CreateBattle> {
  final premiumRepo = PremiumRepo();
  final formKey = GlobalKey<FormState>();
  final titleCtr = TextEditingController();
  final descriptionCtr = TextEditingController();
  final searchCtr = TextEditingController();
  PickedFile? imageFile;
  Color imageTitleColor = white;

  String type = "vs";
  bool private = false;
  Duration deadline = Duration(days: 1);
  int category = 0;
  List<Duration> durations = [
    Duration(days: 1),
    Duration(days: 2),
    Duration(days: 3),
    Duration(days: 4),
    Duration(days: 5),
    Duration(days: 6),
    Duration(days: 7),
    Duration(days: 14),
  ];
  List<SUserModel> moderators = [];
  List<SUserModel> searchedUsers = [];
  bool submitting = false;

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
                          onPressed: submit,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                          ),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(color: white, fontSize: sfont_18),
                          ),
                        ),
                ],
              ),
              SizedBox(height: 40.pH),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Battle Title",
                            style: TextStyle(color: white, fontSize: sfont_14)),
                        Container(
                          width: sCon.wP(.35),
                          margin: EdgeInsets.only(top: 15.pH, bottom: 30.pH),
                          child: TextFormField(
                            controller: titleCtr,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Title is required";
                              return null;
                            },
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
                              errorBorder: getBorder(solidRed),
                              enabledBorder: getBorder(white),
                              focusedBorder: getBorder(white),
                            ),
                          ),
                        ),
                        Text("Description",
                            style: TextStyle(color: white, fontSize: sfont_14)),
                        Container(
                          width: sCon.wP(.45),
                          margin: EdgeInsets.only(top: 20.pH),
                          child: TextFormField(
                            controller: descriptionCtr,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Description is required";
                              return null;
                            },
                            maxLines: 3,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: TextStyle(
                                color: white,
                                fontSize: sfont_12,
                                fontWeight: kW3),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Enter description here",
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.pW),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Choose Thumbnail",
                          style: TextStyle(
                              color: imageTitleColor, fontSize: sfont_14),
                        ),
                        SizedBox(height: 20.pH),
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
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title: const Text('Gallery'),
                                        onTap: () {
                                          _pickImage(ImageSource.gallery);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                            Icons.camera_alt_rounded),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          _pickImage(ImageSource.camera);
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
                            height: 225.pH,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: imageFile != null
                                ? ImageBuilder(
                                    imageProvider:
                                        FileImage(File(imageFile!.path)),
                                    fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.pH),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Versus",
                      style: TextStyle(color: white, fontSize: sfont_14)),
                  SizedBox(
                    height: 40,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Switch.adaptive(
                        value: type == "vs",
                        activeColor: storyBrown,
                        inactiveTrackColor: Colors.transparent,
                        inactiveThumbColor: white,
                        trackOutlineColor:
                            WidgetStateColor.resolveWith((states) => white),
                        onChanged: (value) => changeType(),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.pH),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Community",
                        style: TextStyle(color: white, fontSize: sfont_14)),
                    SizedBox(
                      height: 40,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Switch.adaptive(
                          value: type == "community",
                          activeColor: storyBrown,
                          inactiveTrackColor: Colors.transparent,
                          inactiveThumbColor: white,
                          trackOutlineColor:
                              WidgetStateColor.resolveWith((states) => white),
                          onChanged: (value) => changeType(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Private Battle",
                      style: TextStyle(color: white, fontSize: sfont_14)),
                  IconButton(
                    onPressed: () => setState(() => private = !private),
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    constraints: BoxConstraints(),
                    icon: Icon(
                      private ? Icons.lock : Icons.lock_open_rounded,
                      color: private ? storyBrown : grey2,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.pH),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Deadline",
                        style: TextStyle(color: white, fontSize: sfont_14)),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: grey1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<Duration>(
                        value: deadline,
                        underline: SizedBox(),
                        style: TextStyle(color: white, fontSize: sfont_14),
                        dropdownColor: grey1,
                        iconSize: 15,
                        iconEnabledColor: white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        onChanged: (value) => setState(() => deadline = value!),
                        items: durations.map<DropdownMenuItem<Duration>>((e) {
                          return DropdownMenuItem(
                              value: e, child: Text(dToDays(e)));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Categories",
                  style: TextStyle(color: white, fontSize: sfont_14)),
              SizedBox(height: 10),
              Consumer<CategoryViewModel>(builder: (context, model, child) {
                final categories = model.categories;
                final response = model.categoryApiResponse;

                if (response.status != Status.COMPLETED) return Loading();

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      final ctg = categories[index];
                      if (index == 0 && category == 0) category = ctg.id!;
                      Color color = category == ctg.id ? storyBrown : grey2;
                      Color tColor = category == ctg.id ? storyBrown : white;

                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () => setState(() => category = ctg.id!),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: color, width: 3),
                                ),
                                child: ImageBuilder(
                                  height: 50.pW,
                                  width: 50.pW,
                                  fit: BoxFit.cover,
                                  imageUrl: ctg.image!,
                                  circular: true,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                ctg.name!,
                                style: TextStyle(
                                    color: tColor, fontSize: sfont_10),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.pH),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Moderators",
                      style: TextStyle(
                          color: white, fontSize: sfont_14, fontWeight: kW3),
                    ),
                    SizedBox(
                      width: sCon.wP(.3),
                      child: TextFormField(
                        controller: searchCtr,
                        style: TextStyle(
                            color: white, fontSize: sfont_12, fontWeight: kW3),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: white.withOpacity(.5),
                            fontSize: sfont_12,
                            fontWeight: kW3,
                          ),
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () => searchUser(),
                            child: Icon(Icons.search, color: white, size: 20),
                          ),
                          suffixIconConstraints: BoxConstraints(),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (searchedUsers.isNotEmpty)
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30.pH),
                      padding: EdgeInsets.all(10),
                      height: sCon.hP(.3),
                      decoration: BoxDecoration(
                        color: grey1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              List.generate(searchedUsers.length, (index) {
                            final user = searchedUsers[index];
                            double bottomP =
                                index + 1 != searchedUsers.length ? 15.pH : 0;
                            return Padding(
                              padding: EdgeInsets.only(bottom: bottomP),
                              child: UserSelection(
                                image: user.avatar,
                                name: user.nickName,
                                onTap: () =>
                                    setState(() => moderators.add(user)),
                                add: true,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () => setState(() {
                          searchCtr.clear();
                          searchedUsers = [];
                        }),
                        constraints: BoxConstraints(),
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        icon: Icon(Icons.cancel_rounded, color: white),
                      ),
                    ),
                  ],
                ),
              if (moderators.isNotEmpty)
                ...List.generate(moderators.length, (index) {
                  final user = moderators[index];
                  double bottomP = index + 1 != moderators.length ? 15.pH : 0;
                  return Padding(
                    padding: EdgeInsets.only(bottom: bottomP),
                    child: UserSelection(
                      image: user.avatar,
                      name: user.nickName,
                      onTap: () => setState(
                          () => moderators.removeWhere((e) => e.id == user.id)),
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  InputBorder getBorder(Color color) =>
      UnderlineInputBorder(borderSide: BorderSide(color: color));

  changeType() {
    type == "community" ? type = "vs" : type = "community";
    setState(() {});
  }

  String dToDays(Duration d) {
    int dayNum = d.inDays;

    if (dayNum == 1) return "1 day";
    if (dayNum % 7 == 0) {
      int weekNum = dayNum ~/ 7;
      if (weekNum == 1) return "1 week";
      return "$weekNum weeks";
    }
    return "$dayNum days";
  }

  Future<void> _pickImage(ImageSource source) async {
    final selected =
        await ImagePicker().pickImage(source: source, imageQuality: 10);
    if (selected == null) return;
    setState(() {
      imageTitleColor = white;
      imageFile = PickedFile(selected.path);
    });
  }

  searchUser() async {
    String prm = searchCtr.text;
    if (prm.isEmpty) return;

    final res = await premiumRepo.search(prm, skipWar: true);
    if (res.status == Status.COMPLETED)
      setState(() => searchedUsers = res.data!.users);
  }

  submit() async {
    if (!formKey.currentState!.validate()) return;
    if (imageFile == null) return setState(() => imageTitleColor = solidRed);

    setState(() => submitting = true);

    final cdnRes = await premiumRepo.uploadCDNFile(imageFile!.path);
    if (cdnRes.status == Status.COMPLETED) {
      String imagePath =
          "https://storyappcdn.b-cdn.net//${imageFile!.path.split("/").last}";

      final param = CBattlePrm(
        moderators: moderators.map((e) => e.id).toList(),
        title: titleCtr.text,
        description: descriptionCtr.text,
        thumbnailUrl: imagePath,
        private: private,
        type: type,
        category: category,
        deadline: DateTime.now().add(deadline),
      );

      final res = await premiumRepo.createBattle(param);
      if (res.status == Status.COMPLETED) {
        showTopOverlayNotification(title: "$type War Battle Created");

        titleCtr.clear();
        descriptionCtr.clear();
        imageFile = null;
        searchCtr.clear();
        type = "vs";
        private = false;
        deadline = Duration(days: 1);
        category = 0;
        searchedUsers = [];
        moderators = [];
      }
    }

    setState(() => submitting = false);
  }
}
