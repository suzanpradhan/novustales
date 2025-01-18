import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failures.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../../domain/usecases/comments/get_comments.dart';

part 'generated/get_comments_bloc.freezed.dart';
part 'get_comments_event.dart';
part 'get_comments_state.dart';

class GetCommentsBloc extends Bloc<GetCommentsEvent, GetCommentsState> {
  final GetComments _getComments;
  int currentPage = 0;
  bool hasMoreData = true;

  GetCommentsBloc(this._getComments) : super(_Initial(stories: [])) {
    on<GetCommentsEvent>((event, emit) {});

    on<_Attempt>((event, emit) async {
      if (hasMoreData) {
        currentPage += 1;
        emit(_Loading(stories: state.stories));
        final data = await _getComments.call(GetCommentsParams(
            storyId: int.parse(event.storyId), page: currentPage));
        data.fold((failure) {
          if (failure is ServerFailure) {
            emit(_Failed(
                message: failure.message ?? '', stories: state.stories));
          }
        }, (response) {
          hasMoreData = response.nextPage ?? false;

          emit(_Success(stories: state.stories + (response.results ?? [])));
        });
      }
    });

    // on<_Paginate>((event, emit) async {
    //   emit(_Loading(stories: state.stories));

    //   if (hasMoreData) {
    //     final data = await _getComments.call(GetCommentsParams(
    //         storyId: int.parse(event.storyId), page: currentPage));
    //     data.fold((failure) {
    //       if (failure is ServerFailure) {
    //         emit(_Failed(
    //             message: failure.message ?? '', stories: state.stories));
    //       }
    //     }, (response) {
    //       hasMoreData = response.nextPage ?? false;
    //       currentPage = currentPage + 1;
    //       emit(_Success(stories: state.stories + (response.results ?? [])));
    //     });
    //   }
    // });
  }
}
