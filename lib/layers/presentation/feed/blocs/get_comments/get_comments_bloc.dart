import 'dart:developer';

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

  GetCommentsBloc(this._getComments) : super(_Initial()) {
    on<GetCommentsEvent>((event, emit) {});

    on<_Attempt>((event, emit) async {
      log("here");
      emit(_Loading());
      currentPage = 1;

      final data = await _getComments
          .call(GetCommentsParams(storyId: int.parse(event.storyId)));
      data.fold((failure) {
        if (failure is ServerFailure) {
          emit(_Failed(message: failure.message ?? ''));
        }
      }, (response) {
        emit(_Success(stories: response.results ?? []));
      });
    });

    on<_Paginate>((event, emit) async {
      emit(_Loading());
      currentPage = currentPage + 1;
      final data = await _getComments.call(GetCommentsParams(
          storyId: int.parse(event.storyId), page: currentPage));
      data.fold((failure) {
        if (failure is ServerFailure) {
          emit(_Failed(message: failure.message ?? ''));
        }
      }, (response) {
        bool hasMoreData = response.nextPage ?? false;
        if (hasMoreData) {
          emit(_Success(stories: response.results ?? []));
        }
      });
    });
  }
}
