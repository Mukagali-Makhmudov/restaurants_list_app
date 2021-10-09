import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoTextField(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
            placeholder: 'Логин или почта',
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Container(
            height: 1,
            color: Color(0xFFE0E6ED),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          CupertinoTextField(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
            placeholder: 'Пароль',
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            style: TextStyle(
              fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF4631D2),
              child: Text('Войти'),
              onPressed: () {},
            ),
          ),

          SizedBox(height: 19),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF4631D2),
              child: Text('Зарегистрироваться'), 
              onPressed: () {
                Navigator.pushNamed(context, '/auth/register');
              },
            ),
          ),
        ],
      ),
    );
  }
}