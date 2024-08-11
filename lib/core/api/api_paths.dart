class ApiPaths {
  ApiPaths._();

  static const String baseUrl = "https://brain.novutales.com";
  static const String apiBaseUrl = "$baseUrl/api";
  static const String storageUrl = "$baseUrl/storage/";
  static const String emailLoginUrl = "/auth/jwt/create/";
  static const String googleSignInUrl = "/login/google";
  static const String appleSignInUrl = "/login/apple";
  static const String emailRegisterUrl = "/auth/users/";
  static const String logoutUrl = "/logout";
  static const String talesUrl = "/api/story/wars/";
  static const String foryoufeedUrl = "/api/story/for_you/";
  static const String trendingfeedUrl = "/api/story/trending/";
}
