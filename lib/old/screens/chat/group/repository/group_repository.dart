import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storyv2/old/helper/custom_loader.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:uuid/uuid.dart';

import '../../../../model/response/group.dart';
import '../../../../providers/common_firebase_storage.dart';

final groupRepositoryProvider = Provider(
  (ref) => GroupRepository(
    firestore: FirebaseFirestore.instance,
    ref: ref,
  ),
);

class GroupRepository {
  final FirebaseFirestore firestore;
  final ProviderRef ref;
  GroupRepository({
    required this.firestore,
    required this.ref,
  });

  void createGroup(BuildContext context, String name, File profilePic,
      List<String> selectedContact, String senderId) async {
    try {
      List<String> uids = [];
      for (int i = 0; i < selectedContact.length; i++) {
        var userCollection = await firestore
            .collection('users')
            .where('uid', isEqualTo: selectedContact[i])
            .get();

        if (userCollection.docs.isNotEmpty && userCollection.docs[0].exists) {
          uids.add(userCollection.docs[0].data()['uid']);
        }
      }
      var groupId = const Uuid().v1();

      String profileUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileToFirebase(
            'group/$groupId',
            profilePic,
          );
      Group group = Group(
        adminId: senderId,
        senderId: senderId,
        name: name,
        groupId: groupId,
        lastMessage: '',
        groupPic: profileUrl,
        membersUid: [senderId, ...uids],
        timeSent: DateTime.now(),
      );

      await firestore
          .collection('groups')
          .doc(groupId)
          .set(group.toMap())
          .then((value) {
        Navigator.of(context).pop();
        customLoadStop();
      });
    } catch (e) {
      showTopOverlayNotificationError(title: e.toString());
    }
  }
}
