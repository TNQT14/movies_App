class ApiConstance {
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  static const String host = "http://10.0.29.152:9000";

  static const String nowPlayingMoviesPath =
      "$host/api/netflix?page=1";

  static const String upcomingMoviesPath =
      "$host/api/netflix?page=1";

  static const String popularMoviesPath =
      "$host/api/netflix?page=1";

  static String movieDetailsPath(int movieID) =>
      "$host/api/netflix/$movieID";

  static String movieRecommendationPath(int movieID) =>
      "$host/api/$movieID/recommendations";

  static String imageURL(String imagePath) => '$imagePath';

}
