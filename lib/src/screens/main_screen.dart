
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/screens/favorites_screen.dart';
import 'package:flutter_application_1/src/screens/home_screen.dart';
import 'package:flutter_application_1/src/screens/map_screen.dart';
import 'package:flutter_application_1/src/screens/profile_screen.dart';

import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, color: AppColors.iconBlack,), label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.map, color: AppColors.iconBlack,), label: 'Карта'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.star, color: AppColors.iconBlack,), label: 'Избранные'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person,color: AppColors.iconBlack,), label: 'Профиль'),
          ],
        ),
        tabBuilder: (context, index){
          return CupertinoTabView(
            builder: (context){
              switch (index){
                case 0: return HomeScreen();
                case 1: return MapScreen();
                case 2: return FavoritesScreen();
                case 3: return ProfileScreen();
                default: return HomeScreen();
              }
            },
          );
        },
      ),
    );
  }
}