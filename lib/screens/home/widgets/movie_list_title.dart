// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies/config/theme/app_colors.dart';
import 'package:movies/config/theme/app_theme.dart';

class MovieListTitle extends StatelessWidget {
  final String title;
  const MovieListTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverPadding(
      padding: EdgeInsets.all(24.w),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              title,
              style: theme.textTheme.headlineSmall!.copyWith(
                  color: AppDynamicColorBuilder.getGrey900AndWhite(context)),
            ),
            const Spacer(),
            Text(
              'See all',
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.primaryColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
