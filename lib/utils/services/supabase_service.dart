import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../layers/data/models/chat/room_response.dart';
import 'dotenv_service.dart';

class SupabaseService {
  SupabaseClient get client => Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: EnvironmentService.getValue("SUPABASE_URL") ?? "",
      anonKey: EnvironmentService.getValue("SUPABASE_ANON_KEY") ?? "",
    );
  }

  (int, int) getPagination({int? page, int? size}) {
    final limit = (size != null) ? size : 3;
    final from = page != null ? (page - 1) * limit : 0;
    final to = page != null ? from + limit : limit;
    return (from, to);
  }

  Stream<List<RoomModel>> rooms() async* {
    yield* client
        .schema("public")
        .from("rooms")
        .stream(primaryKey: ['id']).map((rooms) {
      return rooms.map((room) {
        return RoomModel.fromJson(room);
      }).toList();
    });
  }

  Future<List<RoomModel>> getMyContacts(
      {int? page, int? size, required String uuid}) async {
    log("rooms logs");

    final paginationRange = getPagination(page: page, size: size);
    final rooms = await client.from("rooms").select(
          'id, name, members!inner(*)',
        );

    // .filter("members.profile_id", "eq", uuid);
    // .limit(10)
    // .range(paginationRange.$1, paginationRange.$2);
    return rooms.map((room) => RoomModel.fromJson(room)).toList();
  }
}
