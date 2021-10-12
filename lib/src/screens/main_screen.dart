

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screens/auth_screen.dart';
import 'package:flutter_application_1/src/screens/favourites_screen.dart';
import 'package:flutter_application_1/src/screens/home_screen.dart';
import 'package:flutter_application_1/src/screens/map_screen.dart';
import 'package:flutter_application_1/src/screens/profile_screen.dart';
import 'package:flutter_application_1/src/screens/register_screen.dart';

import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.gift)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.star)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
        ],
      ),
      tabBuilder: (context, index){
        return CupertinoTabView(
          builder: (context){
            switch (index){
              case 0: return HomeScreen();
              case 1: return MapScreen();
              case 2: return FavouritesScreen();
              case 3: return ProfileScreen();
              default: return HomeScreen();
            }
          },
        );
      },
    );
  }
}