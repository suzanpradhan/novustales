import 'package:dio/dio.dart';

import '../../model/story_response.dart';

class TestRepository {
  final Dio _dio = Dio();
  var url =
      'http://brain.novutales.com/api/story/get_story_by_category/?category=Tiktok';

  Future<StResponse> getTrending() async {
    try {
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        return handler.next(options);
      }));
      Response response = await _dio.get(url);

      return StResponse.fromJson(response.data);
    } catch (error) {
      print(error.toString());
      return StResponse.withError(error.toString());
    }
  }
}
