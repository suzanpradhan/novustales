import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storyv2/old/network/repo/test_repo.dart';

import '../../model/story_response.dart';

class FeedBloc {
  final TestRepository _repository = TestRepository();
  final BehaviorSubject<StResponse> _subject = BehaviorSubject<StResponse>();

  getFeeds() async {
    StResponse response = await _repository.getTrending();
    print(response.results);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = StResponse(count: 0, next: "", previous: "", results: []);
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<StResponse> get subject => _subject;
}

final feedBloc = FeedBloc();
