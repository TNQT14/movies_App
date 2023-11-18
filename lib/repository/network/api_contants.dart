class ApiConstance {
  static const String baseProfileUrl = '';
  static const String baseStillUrl = '';
  static const String baseAvatarUrl = '';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';
  static const String baseImageURL = "";

  static const String host = "http://10.0.29.152:9000";

  static const String castPlaceHolder =
      '';

  static const String avatarPlaceHolder =
      '';

  /// API Constance For Movies
  static const String nowPlayingMoviesPath =
      "$host/api/netflix?page=1";

  static const String upcomingMoviesPath =
      "$host/api/netflix?page=1";

  static const String popularMoviesPath =
      "$host/api/netflix?page=1";

  static const String topRatedMoviesPath =
      "";

  static String movieDetailsPath(int movieID) =>
      "$host/api/netflix/$movieID";

  static String movieRecommendationPath(int movieID) =>
      "$host/api/$movieID/recommendations";

  static String movieSimilarPath(int movieID) =>
      "";

  // static String getAllPopularMoviesPath(int page) {
  //   return '';
  // }

  /// API Constance For Base Image URL
  static String imageURL(String imagePath) => '$imagePath';

}
