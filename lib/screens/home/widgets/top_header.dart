import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/config/global/constants/image_routes.dart';
import 'package:movies/config/theme/app_colors.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [_TopImageSection(), _TopIconsSection(), _BottomSection()],
      ),
    );
  }
}

class _TopImageSection extends StatelessWidget {
  const _TopImageSection({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    const designHeight = 926.0;
    const imageHeight = 400.0;
    final heightRatio = screenHeight / designHeight;
    final responsiveImageheight = heightRatio * imageHeight;

    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.center,
          colors: [
            Color(0xff181A20),
            Colors.white,
          ]).createShader(bounds),
      blendMode: BlendMode.modulate,
      child: Image.asset(
        AppImagesRoute.homeTopHeaderImage,
        fit: BoxFit.cover,
        height: responsiveImageheight,
        width: double.infinity,
      ),
    );
  }
}

class _TopIconsSection extends StatelessWidget {
  const _TopIconsSection({Key? key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Row(
        children: [
          SvgPicture.asset(AppImagesRoute.appLogo),
          const Spacer(),
          SvgPicture.asset(AppImagesRoute.iconSearch),
          const SizedBox(
            width: 24,
          ),
          SvgPicture.asset(AppImagesRoute.iconBell),
        ],
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({Key? key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Positioned(
      bottom: 24,
      left: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dr. Strange 2",
              style: theme.textTheme.headlineMedium!
                  .copyWith(color: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Action, Superhero, Science Fiction, ...',
            style: theme.textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 32,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImagesRoute.iconPlay),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Play',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 32,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.white, width: 2),
                            borderRadius: BorderRadius.circular(100))),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImagesRoute.iconPlus),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'My List',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
