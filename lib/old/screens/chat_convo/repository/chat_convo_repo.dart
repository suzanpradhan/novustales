import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:uuid/uuid.dart';

import '../../../constants/message_enum.dart';
import '../../../model/response/chat_contact.dart';
import '../../../model/response/group.dart';
import '../../../model/response/message.dart';
import '../../../model/response/user_firebase_model.dart';
import '../../../providers/common_firebase_storage.dart';
import '../../../providers/common_provider.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class ChatRepository {
  final FirebaseFirestore firestore;

  ChatRepository({
    required this.firestore,
  });

  Stream<List<ChatContact>> getChatContacts(String senderId) {
    return firestore
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatContact> contacts = [];
      for (var document in event.docs) {
        var chatContact = ChatContact.fromMap(document.data());
        var userData =
            await firestore.collection('users').doc(chatContact.uid).get();
        var user = UserFirebaseModel.fromJson(userData.data()!);

        contacts.add(
          ChatContact(
            name: user.name ?? "",
            profilePic: user.image ?? "",
            uid: chatContact.uid,
            timeSent: chatContact.timeSent,
            lastMessage: chatContact.lastMessage,
          ),
        );
      }
      return contacts;
    });
  }

  Stream<List<Group>> getChatGroups(String senderId) {
    return firestore.collection('groups').snapshots().map((event) {
      List<Group> groups = [];
      for (var document in event.docs) {
        var group = Group.fromMap(document.data());
        if (group.membersUid.contains(senderId)) {
          groups.add(group);
        }
      }
      return groups;
    });
  }

  Stream<List<Message>> getChatStream(String recieverUserId, String senderId) {
    return firestore
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> messages = [];
      for (var document in event.docs) {
        messages.add(Message.fromMap(document.data()));
      }
      return messages;
    });
  }

  Stream<List<Message>> getGroupChatStream(String groudId) {
    return firestore
        .collection('groups')
        .doc(groudId)
        .collection('chats')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> messages = [];
      for (var document in event.docs) {
        messages.add(Message.fromMap(document.data()));
      }
      return messages;
    });
  }

  void _saveDataToContactsSubcollection(
      UserFirebaseModel senderUserData,
      UserFirebaseModel? recieverUserData,
      String text,
      DateTime timeSent,
      String recieverUserId,
      bool isGroupChat,
      String senderId) async {
    if (isGroupChat) {
      await firestore.collection('groups').doc(recieverUserId).update({
        'lastMessage': text,
        'timeSent': DateTime.now().millisecondsSinceEpoch,
      });
    } else {
// users -> reciever user id => chats -> current user id -> set data
      var recieverChatContact = ChatContact(
        name: senderUserData.name ?? "",
        profilePic: senderUserData.image ?? "",
        uid: senderUserData.uid ?? "",
        timeSent: timeSent,
        lastMessage: text,
      );
      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(senderId)
          .set(
            recieverChatContact.toMap(),
          );
      // users -> current user id  => chats -> reciever user id -> set data
      var senderChatContact = ChatContact(
        name: recieverUserData?.name ?? "",
        profilePic: recieverUserData?.image ?? "",
        uid: recieverUserData?.uid ?? "",
        timeSent: timeSent,
        lastMessage: text,
      );
      await firestore
          .collection('users')
          .doc(senderId)
          .collection('chats')
          .doc(recieverUserId)
          .set(
            senderChatContact.toMap(),
          );
    }
  }

  void _saveMessageToMessageSubcollection({
    required String recieverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    required MessageEnum messageType,
    required MessageReply? messageReply,
    required String senderUsername,
    required String? recieverUserName,
    required bool isGroupChat,
    required String senderId,
  }) async {
    final message = Message(
      senderId: senderId,
      recieverid: recieverUserId,
      text: text,
      type: messageType,
      timeSent: timeSent,
      messageId: messageId,
      isSeen: false,
      repliedMessage: messageReply == null ? '' : messageReply.message,
      repliedTo: senderUsername,
      // repliedTo: messageReply == null
      //     ? ''
      //     : messageReply.isMe
      //         ? senderUsername
      //         : recieverUserName ?? '',
      repliedMessageType:
          messageReply == null ? MessageEnum.text : messageReply.messageEnum,
    );
    print("MESSAGE FIREBASE::${message.toMap()}");
    if (isGroupChat) {
      // groups -> group id -> chat -> message
      await firestore
          .collection('groups')
          .doc(recieverUserId)
          .collection('chats')
          .doc(messageId)
          .set(
            message.toMap(),
          );
    } else {
      // users -> sender id -> reciever id -> messages -> message id -> store message
      await firestore
          .collection('users')
          .doc(senderId)
          .collection('chats')
          .doc(recieverUserId)
          .collection('messages')
          .doc(messageId)
          .set(
            message.toMap(),
          );
      // users -> eciever id  -> sender id -> messages -> message id -> store message
      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(senderId)
          .collection('messages')
          .doc(messageId)
          .set(
            message.toMap(),
          );
    }
  }

  void sendTextMessage(
      {required BuildContext context,
      required String text,
      required String recieverUserId,
      required String senderId,
      required UserFirebaseModel senderUser,
      required MessageReply? messageReply,
      required bool isGroupChat,
      re}) async {
    try {
      var timeSent = DateTime.now();
      UserFirebaseModel? recieverUserData;

      if (!isGroupChat) {
        var userDataMap =
            await firestore.collection('users').doc(recieverUserId).get();
        recieverUserData = UserFirebaseModel.fromJson(userDataMap.data()!);
      }

      var messageId = const Uuid().v1();

      _saveDataToContactsSubcollection(senderUser, recieverUserData, text,
          timeSent, recieverUserId, isGroupChat, senderId);

      _saveMessageToMessageSubcollection(
        recieverUserId: recieverUserId,
        text: text,
        timeSent: timeSent,
        messageType: MessageEnum.text,
        messageId: messageId,
        username: senderUser.name ?? "",
        messageReply: messageReply,
        recieverUserName: recieverUserData?.name,
        senderUsername: senderUser.name ?? "",
        isGroupChat: isGroupChat,
        senderId: senderId,
      );
    } catch (e) {
      showTopOverlayNotificationError(title: e.toString());
    }
  }

  void sendFileMessage({
    required BuildContext context,
    required File file,
    required String recieverUserId,
    required String senderId,
    required UserFirebaseModel senderUserData,
    required ProviderRef ref,
    required MessageEnum messageEnum,
    required MessageReply? messageReply,
    required bool isGroupChat,
  }) async {
    try {
      var timeSent = DateTime.now();
      var messageId = const Uuid().v1();

      String imageUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileToFirebase(
            'chat/${messageEnum.type}/${senderUserData.uid}/$recieverUserId/$messageId',
            file,
          );

      UserFirebaseModel? recieverUserData;
      if (!isGroupChat) {
        var userDataMap =
            await firestore.collection('users').doc(recieverUserId).get();
        recieverUserData = UserFirebaseModel.fromJson(userDataMap.data()!);
      }

      String contactMsg;

      switch (messageEnum) {
        case MessageEnum.image:
          contactMsg = '📷 Photo';
          break;
        case MessageEnum.video:
          contactMsg = '📸 Video';
          break;
        case MessageEnum.audio:
          contactMsg = '🎵 Audio';
          break;
        case MessageEnum.gif:
          contactMsg = 'GIF';
          break;
        default:
          contactMsg = 'GIF';
      }
      _saveDataToContactsSubcollection(senderUserData, recieverUserData,
          contactMsg, timeSent, recieverUserId, isGroupChat, senderId);

      _saveMessageToMessageSubcollection(
        recieverUserId: recieverUserId,
        text: imageUrl,
        timeSent: timeSent,
        messageId: messageId,
        username: senderUserData.name ?? "",
        messageType: messageEnum,
        messageReply: messageReply,
        recieverUserName: recieverUserData?.name,
        senderUsername: senderUserData.name ?? "",
        isGroupChat: isGroupChat,
        senderId: senderId,
      );
    } catch (e) {
      showTopOverlayNotificationError(title: e.toString());
    }
  }

  void sendGIFMessage({
    required BuildContext context,
    required String gifUrl,
    required String recieverUserId,
    required String senderId,
    required UserFirebaseModel senderUser,
    required MessageReply? messageReply,
    required bool isGroupChat,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserFirebaseModel? recieverUserData;

      if (!isGroupChat) {
        var userDataMap =
            await firestore.collection('users').doc(recieverUserId).get();
        recieverUserData = UserFirebaseModel.fromJson(userDataMap.data()!);
      }

      var messageId = const Uuid().v1();

      _saveDataToContactsSubcollection(senderUser, recieverUserData, 'GIF',
          timeSent, recieverUserId, isGroupChat, senderId);

      _saveMessageToMessageSubcollection(
          recieverUserId: recieverUserId,
          text: gifUrl,
          timeSent: timeSent,
          messageType: MessageEnum.gif,
          messageId: messageId,
          username: senderUser.name ?? "",
          messageReply: messageReply,
          recieverUserName: recieverUserData?.name,
          senderUsername: senderUser.name ?? "",
          isGroupChat: isGroupChat,
          senderId: senderId);
    } catch (e) {
      showTopOverlayNotificationError(title: e.toString());
    }
  }

  void setChatMessageSeen(
    BuildContext context,
    String recieverUserId,
    String messageId,
    String senderId,
  ) async {
    try {
      await firestore
          .collection('users')
          .doc(senderId)
          .collection('chats')
          .doc(recieverUserId)
          .collection('messages')
          .doc(messageId)
          .update({'isSeen': true});

      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(senderId)
          .collection('messages')
          .doc(messageId)
          .update({'isSeen': true});
    } catch (e) {
      showTopOverlayNotificationError(title: e.toString());
    }
  }
}
