import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: AuthScreen(),
    );
  }
}

