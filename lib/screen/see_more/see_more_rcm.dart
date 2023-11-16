import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/image_with_simmer.dart';
import '../../component/space.dart';
import '../../model/movies_model/movies.dart';
import '../../model/movies_model/movies_recomment.dart';
import '../../repository/network/api_contants.dart';
import '../../theme/app_color/app_color_dark.dart';
import '../../theme/theme_data/theme_data.dart';
import '../../utils/enum.dart';
import '../movies_screen/movies_detail_screen.dart';

class SeeMoreScreenRCM extends StatelessWidget {
  const SeeMoreScreenRCM({Key? key, required this.movieList, required this.title})
      : super(key: key);

  final List<MoviesRecommendation> movieList;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsDark.greyDarkColor,
        elevation: 0,
        title: Text(
          "$title Movies".toUpperCase(),
          style: textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 12).r,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Container(
            decoration: BoxDecoration(
              color: AppColorsDark.darkPrimary,
              borderRadius: BorderRadius.circular(10).r,
            ),
            padding: const EdgeInsets.all(10).r,
            margin: const EdgeInsets.symmetric(vertical: 10).r,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieDetailsScreen(
                        movieID: movie.id,
                      );
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ).r,
                    child: ImageWithShimmer(
                      imageUrl: ApiConstance.imageURL(movie.backdropPath ?? 'https://upload.wikimedia.org/wikipedia/vi/a/ab/Titanic_3D_poster_Vietnam.jpg'),
                      width: 120.w,
                      height: 140.h,
                    ),
                  ),
                  Space(height: 0, width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: textTheme.labelLarge,
                        ),
                        Space(height: 5.h, width: 0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ).r,
                              decoration: BoxDecoration(
                                color: AppColorsDark.primaryRedColor,
                                borderRadius: BorderRadius.circular(4.0).r,
                              ),
                              child: Text(
                                movie.releaseDate.split('-')[0],
                                style: textTheme.titleSmall,
                              ),
                            ),
                            Space(height: 0, width: 16.w),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.star,
                            //       color: AppColorsDark.iconRateColor,
                            //       size: 20.sp,
                            //     ),
                            //     Space(height: 0, width: 4.w),
                            //     Text(
                            //       (movie.voteAverage).toStringAsFixed(1),
                            //       style: textTheme.titleMedium,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        Space(height: 10.h, width: 0),
                        Text(
                          movieList[index].overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
