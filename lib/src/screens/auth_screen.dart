import 'package:flutter/cupertino.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Авторизация'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoTextField(
            placeholder: 'Логин или почта',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoTextField(
            placeholder: 'Пароль',
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
              onPressed: () {}
            ),
          ),
        ],
      ),
    );
  }
}