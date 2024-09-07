import '../../../core/usecases/usecase.dart';
import '../entities/chat/room_entity.dart';
import '../usecases/chat/check_or_create_profile.dart';

abstract class ChatRepository {
  Future<List<RoomEntity>> getRooms(NoParams params);
  Future<bool> checkOrCreateProfile(CheckOrCreateProfileParams params);
}
