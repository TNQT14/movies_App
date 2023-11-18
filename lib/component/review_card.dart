import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/component/review_content.dart';

import '../model/movies_model/review.dart';
import '../theme/app_color/app_color_dark.dart';
import '../theme/theme_data/theme_data.dart';
import '../utils/enum.dart';
import '../utils/function.dart';
import 'avatar.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;
    return InkWell(
      onTap: () {
        showCustomBottomSheet(context, ReviewContent(review: review));
      },
      child: Container(
        padding: const EdgeInsets.all(12).r,
        width: 240.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColorsDark.greyDarkColor,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 6).r,
                //   child: Avatar(avatarUrl: review.avatarUrl),
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        review.authorUserName,
                        style: textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              review.content,
              style: textTheme.bodyLarge,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getRatingBarIndicator(review.rating),
                Text(
                  review.elapsedTime,
                  style: textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _getRatingBarIndicator(double rating) {
  if (rating != -1) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 16,
      unratedColor: Colors.white54,
      itemBuilder: (_, __) {
        return Icon(
          Icons.star_rate_rounded,
          color: AppColorsDark.iconRateColor,
          size: 24.sp,
        );
      },
    );
  } else {
    return const SizedBox();
  }
}
