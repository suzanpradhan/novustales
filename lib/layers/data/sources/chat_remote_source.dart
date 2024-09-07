import 'dart:developer';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../../utils/dependencies_injection.dart';
import '../../../utils/secure_storage.dart';
import '../../../utils/services/supabase_service.dart';
import '../../domain/usecases/chat/check_or_create_profile.dart';
import '../models/chat/chat_user.dart';
import '../models/chat/room_response.dart';
import 'user_source.dart';

abstract class ChatRemoteSource {
  Future<List<RoomModel>> getRooms(NoParams noParams);
  Future<bool> checkOrCreateProfileSource(CheckOrCreateProfileParams params);
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
          if (receiverUserData.isNotEmpty) {
            newContacts.add(contact.copyWith(
                receiverUser:
                    ChatUser.fromJson(receiverUserData.first["profiles"])));
          }
        }
        return contacts;
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
}
