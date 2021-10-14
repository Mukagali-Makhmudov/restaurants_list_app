
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screens/favorites_screen.dart';
import 'package:flutter_application_1/src/screens/home_screen.dart';
import 'package:flutter_application_1/src/screens/map_screen.dart';
import 'package:flutter_application_1/src/screens/profile_screen.dart';

import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, color: CupertinoColors.black,), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.map, color: CupertinoColors.black,), label: 'Карта'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.star, color: CupertinoColors.black,), label: 'Избранные'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person,color: CupertinoColors.black,), label: 'Профиль'),
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
    );
  }
}