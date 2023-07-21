import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/config/global/constants/image_routes.dart';
import 'package:movies/config/theme/app_colors.dart';
import 'package:movies/screens/download/download_screeen.dart';
import 'package:movies/screens/explore/explore_screen.dart';
import 'package:movies/screens/home/home_screen.dart';
import 'package:movies/screens/my_list/my_llist_screen.dart';
import 'package:movies/screens/profile/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _bottomNavBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavBarIndex,
        children: _getLayout(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              currentIndex: _bottomNavBarIndex,
              elevation: 0,
              onTap: (value) => {
                setState(() {
                  _bottomNavBarIndex = value;
                })
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.grey500,
              items: [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconHome),
                    )),
                BottomNavigationBarItem(
                    label: "Explore",
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconExplore),
                    )),
                BottomNavigationBarItem(
                    label: "My List",
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImagesRoute.iconMyList),
                    )),
                BottomNavigationBarItem(
                  label: "Downloads",
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: SvgPicture.asset(AppImagesRoute.iconDownload),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: SvgPicture.asset(AppImagesRoute.iconProfile),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _getLayout() => [
      const HomeScreen(),
      const ExploreScreen(),
      const MyLlistScreen(),
      const DownloadScreeen(),
      const ProfileScreen()
    ];
