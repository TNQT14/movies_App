import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../bloc/movies_bloc/movies_event.dart';
import '../../repository/services/services_locator.dart';
import '../widget/now_playing_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          // ..add(GetPopularMoviesEvent())
          // ..add(GetTopRatedMoviesEvent())
          // ..add(GetUpcomingMoviesEvent())
        ;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              // const UpcomingWidget(),
              // const PopularMoviesWidget(),
              // const TopRatedMoviesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
