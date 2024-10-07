import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/usecases/chat/send_message.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../../utils/dependencies_injection.dart';
import '../../../utils/secure_storage.dart';
import '../../../utils/services/supabase_service.dart';
import '../../domain/usecases/chat/check_or_create_profile.dart';
import '../models/chat/chat_user.dart';
import '../models/chat/message_modal.dart';
import '../models/chat/room_response.dart';
import 'user_source.dart';

abstract class ChatRemoteSource {
  Future<List<RoomModel>> getRooms(NoParams noParams);
  Future<bool> checkOrCreateProfileSource(CheckOrCreateProfileParams params);
  Stream<List<MessageModel>> getMessagesStream({required String roomId});

  Future<Either<Failure, bool>> sendMessage(
      {required SendMessageParams params});
  Future<Either<Failure, bool>> readMessage(
      {required SendMessageParams params});
}

class ChatRemoteSourceImpl implements ChatRemoteSource {
  final SupabaseService supabaseService;
  final UserSource userSource;

  ChatRemoteSourceImpl(this.supabaseService, this.userSource);

  @override
  Future<List<RoomModel>> getRooms(NoParams noParams) async {
    try {
      String? uuid =
          await sl<SecureStorageMixin>().getValue(SecureStorageKeys.uuid);
      if (uuid != null) {
        final contacts = await supabaseService.getMyContacts(uuid: uuid);
        List<RoomModel> newContacts = [];

        for (var contact in contacts) {
          final receiverUserData = await supabaseService.client
              .from("members")
              .select("profiles (*)")
              .eq("room_id", contact.id)
              .neq("profile_id", uuid);

          final lastMessage = await supabaseService.client
              .from("messages")
              .select("content")
              .eq("room_id", contact.id)
              .order("created_at", ascending: false)
              .limit(1);
          final lastMessageTime = await supabaseService.client
              .from("messages")
              .select("created_at")
              .eq("room_id", contact.id)
              .order("created_at", ascending: false)
              .limit(1);

          final unReadMessages = await supabaseService.client
              .from("messages")
              .select("content")
              .eq("room_id", contact.id)
              .eq("read", false)
              .neq("profile_id", uuid)
              .order("created_at", ascending: false);

          if (receiverUserData.isNotEmpty) {
            newContacts.add(contact.copyWith(
                lastMessage: lastMessage[0]['content'],
                read: unReadMessages.isEmpty ? true : false,
                createdAt: lastMessageTime[0]['created_at'],
                receiverUser: receiverUserData
                    .map((user) => ChatUser.fromJson(user["profiles"]))
                    .toList()));
          }
        }
        log("_>>>>>>>>>>>>>>>>>>>>>>>>>>>> $newContacts ");

        return newContacts;
      } else {
        log("_>>>>>>>>>>>>>>>>>>>>>>>>>>>> no user found");
        throw const ServerFailure(message: "No user found");
      }
    } catch (e) {
      log("_>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${e.toString()}");
      throw const ServerFailure(message: "No user found");
    }
  }

  @override
  Future<bool> checkOrCreateProfileSource(
      CheckOrCreateProfileParams params) async {
    try {
      final List<Map<String, dynamic>> data = await supabaseService.client
          .from("profiles")
          .select("id")
          .eq("id", params.uuid);

      // ignore: unnecessary_null_comparison
      if (data == null || data.isEmpty) {
        await supabaseService.client.from("profiles").insert({
          "id": params.uuid,
          "email": params.email,
          "avatar": params.avatar,
          "name": params.name
        });
      }
      return true;
    } catch (e, stackTrace) {
      log("Error: $e");
      log("Stack trace: $stackTrace");
      return false;
    }
  }

  @override
  Future<Either<Failure, bool>> sendMessage(
      {required SendMessageParams params}) async {
    try {
      await supabaseService.client.from("messages").insert(params.toJson());

      return const Right(true);
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure(message: 'Failed to send message.'));
    }
  }

  @override
  Future<Either<Failure, bool>> readMessage(
      {required SendMessageParams params}) async {
    try {
      String? uuid =
          await sl<SecureStorageMixin>().getValue(SecureStorageKeys.uuid);
      if (uuid != null) {
        try {
          await supabaseService.client
              .from("messages")
              .update({'read': true})
              .eq("room_id", params.roomId)
              .eq("profile_id", uuid);
          return const Right(true);
        } catch (e) {
          log("read message error: ${e.toString()}");
          return const Left(ServerFailure(message: 'Failed to read message.'));
        }
      } else {
        return const Left(ServerFailure(message: 'Failed to read message.'));
      }
    } catch (e) {
      log("read message error: ${e.toString()}");
      return const Left(ServerFailure(message: 'Failed to read message.'));
    }
  }

  @override
  Stream<List<MessageModel>> getMessagesStream({required String roomId}) {
    return supabaseService.client
        .from("messages")
        .stream(primaryKey: ['id'])
        .eq("room_id", roomId)
        .order("created_at", ascending: false)
        .map((maps) => maps.map((map) => MessageModel.fromJson(map)).toList());
  }
}
