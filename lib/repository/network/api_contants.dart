class ApiConstance {
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';
  static const String baseImageURL = "";

  static const String host = "http://172.17.17.203:9000";

  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';

  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';

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

  static String getAllPopularMoviesPath(int page) {
    return '';
  }

  static String getAllTopRatedMoviesPath(int page) {
    return '';
  }

  /// API Constance For Base Image URL
  static String imageURL(String imagePath) => '$imagePath';

}
