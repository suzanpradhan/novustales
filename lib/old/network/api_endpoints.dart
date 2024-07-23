class Endpoints {
  ///register
  static const String register = "auth/users/";
  static const String userProfile = "auth/users/me/";
  static const String login = "auth/jwt/create";
  static const String otherUsers = "auth/users/other_user/";
  static const String categories = "api/story/category/";
  static const String forYou = "api/story/for_you/";
  static const String singleCategories = "api/story/get_story_by_category/?category=";
  static const String storyCategory = "api/story/get_story_by_category?category=";
  static const String baseStory = "api/story/trending/";


  static const String userInteraction = "api/users/interest/";

  static const String geTComment = "api/story/comments/?story_id=";
  static const String likeComment = "api/story/comments/like_comment/?comment_id=";
  static const String saveSingleStoryComment = "api/story/comments/?story_id=";


  static const String pinnedFollowedUser = "api/story/followed_user";
  static const String pinUser = "auth/users/pin_user/?pin_user=";


  static const String getCoins = "api/coins";
  static const String getAddCoins = "api/coins/coins/add_coins/?quantity=";


}
