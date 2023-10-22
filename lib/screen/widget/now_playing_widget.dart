import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../bloc/movies_bloc/movies_state.dart';
import '../../component/image_with_simmer.dart';
import '../../component/loading_indicator.dart';
import '../../component/space.dart';
import '../../contants/app_string.dart';
import '../../repository/network/api_contants.dart';
import '../../theme/app_color/app_color_dark.dart';
import '../../theme/theme_data/theme_data.dart';
import '../../utils/enum.dart';
import '../movies_screen/movies_detail_screen.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;

    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
      previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return SizedBox(
              height: 300.h,
              child: const LoadingIndicator(),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 300.h,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                      (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MovieDetailsScreen(movieID: item.id);
                            },
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: ImageWithShimmer(
                              boxFit: BoxFit.fill,
                              imageUrl:
                              ApiConstance.imageURL(item.backdropPath),
                              width: double.infinity,
                              height: 560.h,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8.0, top: 40),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70).r,
                                    child: ImageWithShimmer(
                                      boxFit: BoxFit.fill,
                                      imageUrl: ApiConstance.imageURL(
                                          item.posterPath),
                                      width: 110.w,
                                      height: 100.h,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16.0).r,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color:
                                            AppColorsDark.primaryRedColor,
                                            size: 16.sp,
                                          ),
                                          Space(height: 0, width: 4.w),
                                          Text(
                                            AppString.nowPlaying.toUpperCase(),
                                            style: textTheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 16).r,
                                      child: Text(
                                        item.title,
                                        textAlign: TextAlign.center,
                                        style: textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestState.error:
            return SizedBox(
              height: 300.h,
              child: Center(
                child: Text(
                  state.nowPlayingMessage,
                  style: textTheme.titleLarge,
                ),
              ),
            );
        }
      },
    );
  }
}
