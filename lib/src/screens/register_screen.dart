import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Регистрация'),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 32,),
          CupertinoTextField(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
            placeholder: 'Логин',
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16,),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          Container(
            height: 1,
            color: Color(0xFFE0E6ED),
            margin: const EdgeInsets.symmetric(horizontal: 16,),
          ),
          
          CupertinoTextField(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
            placeholder: 'Телефон',
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            style: TextStyle(fontWeight: FontWeight.bold),
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
            placeholder: 'Почта',
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            style: TextStyle(fontWeight: FontWeight.bold),
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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 270,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF4631D2),
              child: Text('Создать аккаунт'), 
              onPressed: () {}
            ),
          ),
        ],
      ),
    );
  }
}