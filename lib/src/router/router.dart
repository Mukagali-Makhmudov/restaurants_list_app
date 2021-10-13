

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth_screen.dart';
import 'package:flutter_application_1/src/screens/favorites_screen.dart';
import 'package:flutter_application_1/src/screens/home_screen.dart';
import 'package:flutter_application_1/src/screens/main_screen.dart';
import 'package:flutter_application_1/src/screens/map_screen.dart';
import 'package:flutter_application_1/src/screens/profile_screen.dart';
import 'package:flutter_application_1/src/screens/register_screen.dart';

class AppRouter{
  static Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case HomeRoute:
        return CupertinoPageRoute(
          builder: (context) => HomeScreen(),
        );
      case FavouritesRoute:
        return CupertinoPageRoute(
          builder: (context) => FavoritesScreen(),
        );
      case MapRoute:
        return CupertinoPageRoute(
          builder: (context) => MapScreen(),
        );
      case ProfileRoute:
        return CupertinoPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case RestMainRoute:
        return CupertinoPageRoute(
          builder: (context) => MainScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}