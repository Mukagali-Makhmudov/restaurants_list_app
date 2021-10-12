import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/text_field_divider.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            placeholder: 'Логин или почта',
          ),

          TextFieldDivider(),

          CustomTextField(
            placeholder: 'Пароль',
          ),

          SizedBox(height: 32),

          Padding(
            padding: AppPaddings.horizontal,
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF4631D2),
              child: Text('Войти'), 
              onPressed: () {
                Navigator.pushNamed(context, RestMainRoute);
              }
            ),
            ),

          SizedBox(height: 19),

          Padding(
            padding: AppPaddings.horizontal,
            child: CupertinoButton(
              padding: AppPaddings.vertical,
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