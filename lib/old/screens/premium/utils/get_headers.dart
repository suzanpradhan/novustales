import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/environment.config.dart';
import '../../../config/preference_utils.dart';

Future<Map<String, String>> getHeader() async {
  final SharedPreferences localStorage = PreferenceUtils.instance;
  String? token = localStorage.getString('token');
  token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo1MzA2NTE5MDkwLCJqdGkiOiJhY2FjN2RhYjUyOGU0N2UyOWY4NTBlNTI2YjE3NTE2NSIsInVzZXJfaWQiOjExfQ.lYVmAv3SpZNaK48o5JIN5_M9bMhZGqQ29Q6cJWhIuko";

  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
    'platform': EnvironmentConfig.platform,
  };
}
