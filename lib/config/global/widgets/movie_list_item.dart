// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/global/utils/random_movie_point.dart';
import 'package:movies/config/theme/app_colors.dart';

class MovieListItem extends StatelessWidget {
  final int itemIndex;
  final int itemCount;
  final String movieCategory;
  final bool needSpacing;

  const MovieListItem({
    Key? key,
    required this.itemIndex,
    required this.itemCount,
    required this.movieCategory,
    required this.needSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
        width: 150.w,
        margin: needSpacing
            ? EdgeInsets.only(
                left: itemIndex == 0 ? 24.w : 10.w,
                right: itemIndex == itemCount - 1 ? 24.w : 10.w)
            : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image:
                    AssetImage('assets/images/$movieCategory/$itemIndex.png'))),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(6)),
            child: Text(getRandomMoviePoint(minPoint: 7, maxPoint: 10),
                style: theme.textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                )),
          ),
        ));
  }
}
