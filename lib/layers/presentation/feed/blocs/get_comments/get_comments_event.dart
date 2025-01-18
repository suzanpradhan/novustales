part of 'get_comments_bloc.dart';

@freezed
class GetCommentsEvent with _$GetCommentsEvent {
  const factory GetCommentsEvent.attempt({required String storyId}) = _Attempt;
  const factory GetCommentsEvent.paginate({required String storyId}) =
      _Paginate;
}
