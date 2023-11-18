import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/movies_model/movies.dart';
import '../repository/network/api_contants.dart';
import '../screen/movies_screen/movies_detail_screen.dart';
import 'image_with_simmer.dart';

class HorizontalListViewCard extends StatelessWidget {
  const HorizontalListViewCard({
    super.key,
    required this.movies,
  });

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0).r,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieID: movies.id,
              ),
            ),
          );
          if (kDebugMode) {
            print(movies.id);
          }
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: ImageWithShimmer(
            imageUrl: ApiConstance.imageURL(movies.backdropPath),
            width: 120.w,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
