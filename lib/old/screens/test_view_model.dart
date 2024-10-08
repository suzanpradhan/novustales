import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TestViewModel extends ChangeNotifier {
  BuildContext? _context;

  updateContext(BuildContext context) {
    _context = context;
    notifyListeners();
  }

  late Isolate _isolate;
  late SendPort _sendPort;
  late ReceivePort _receivePort;
  final _preloadedContent = <String, dynamic>{};
  final _queue = Queue<String>();

  TestViewModel() {
    _initIsolate();
  }

  Future<void> _initIsolate() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_isolateEntryPoint, _receivePort.sendPort);
    _sendPort = await _receivePort.first;
  }

  void _isolateEntryPoint(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((dynamic message) async {
      final url = message['url'] as String;
      final completer = message['completer'] as Completer<void>;

      // Perform preloading tasks based on the URL
      dynamic preloadedContent;
      if (url.endsWith('.mp4')) {
        final videoPlayerController = VideoPlayerController.network(url);
        await videoPlayerController.initialize();
        preloadedContent = videoPlayerController;
      } else {
        // Preload images or handle other tasks
        final imageProvider = NetworkImage(url);
        await precacheImage(
            imageProvider, _context!); // Pass a suitable context if needed
        preloadedContent = imageProvider;
      }

      completer.complete();
    });
  }

  Future<void> preload(String url) async {
    if (_preloadedContent.containsKey(url) || _queue.contains(url)) return;

    final completer = Completer<void>();
    _queue.add(url);

    _sendPort.send({'url': url, 'completer': completer});

    await completer.future;
    _preloadedContent[url] = true; // Store the completion status
    notifyListeners();
  }

  dynamic getPreloadedContent(String url) => _preloadedContent[url];

  @override
  void dispose() {
    for (var content in _preloadedContent.values) {
      if (content is VideoPlayerController) {
        content.dispose();
      }
    }
    _receivePort.close();
    _isolate.kill();
    super.dispose();
  }
}
