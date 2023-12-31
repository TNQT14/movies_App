import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../bloc/movies_bloc/movies_state.dart';
import '../../component/image_with_simmer.dart';
import '../../component/loading_indicator.dart';
import '../../contants/app_string.dart';
import '../../repository/network/api_contants.dart';
import '../../theme/app_color/app_color_dark.dart';
import '../../theme/theme_data/theme_data.dart';
import '../../utils/enum.dart';
import '../movies_screen/movies_detail_screen.dart';
import '../see_more/see_more_screen.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;

    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
      previous.upcomingState != current.upcomingState,
      builder: (context, state) {
        switch (state.upcomingState) {
          case RequestState.loading:
            return SizedBox(
              height: 130.h,
              child: const LoadingIndicator(),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.allMovive,
                        style: textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return SeeMoreScreen(
                                  movieList: state.upcomingMovies,
                                  title: AppString.allMovive,
                                );
                              },
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Row(
                            children: [
                              Text(
                                AppString.seeMore,
                                style: textTheme.labelSmall,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: AppColorsDark.iconColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 130.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
                      itemCount: state.upcomingMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.upcomingMovies[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 8.0).r,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailsScreen(
                                    movieID: movie.id,
                                  ),
                                ),
                              );
                              if (kDebugMode) {
                                print(movie.id);
                              }
                            },
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(8.0))
                                  .r,
                              child: ImageWithShimmer(
                                imageUrl:
                                ApiConstance.imageURL(movie.backdropPath),
                                width: 120.w,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 400.h,
              child: Center(
                child: Text(
                  state.nowPlayingMessage,
                  style: textTheme.labelLarge,
                ),
              ),
            );
        }
      },
    );
  }
}
