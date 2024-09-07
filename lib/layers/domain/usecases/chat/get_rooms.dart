import '../../../../core/usecases/usecase.dart';
import '../../entities/chat/room_entity.dart';
import '../../repositories/chat_repository.dart';

class GetRooms {
  final ChatRepository chatRepository;

  GetRooms(this.chatRepository);

  Future<List<RoomEntity>> call(NoParams params) async {
    return await (chatRepository.getRooms(params));
  }
}
