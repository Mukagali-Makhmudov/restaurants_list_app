import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/text_field_divider.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:hive/hive.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Dio dio = Dio();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            controller: emailController,
            placeholder: 'Логин или почта',
          ),

          TextFieldDivider(),

          CustomTextField(
            controller: passwordController,
            placeholder: 'Пароль',
          ),

          SizedBox(height: 32),

          Padding(
            padding: AppPaddings.horizontal,
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF4631D2),
              child: Text('Войти'), 
              onPressed: ()async {
                print(emailController.text);
                Dio dio = Dio();
                Box tokensBox = Hive.box('tokens');
                try {
                  Response responce = await dio.post(
                    'http://api.codeunion.kz/api/v1/auth/login',
                    data: {
                      'email': emailController.text,
                      'password': passwordController.text,
                    },
                  );
                  tokensBox.put('access', responce.data['tokens']['accessTokens']);
                  tokensBox.put('refresh', responce.data['tokens']['refreshTokens']);
                  print(tokensBox.get('access'));
                  print(tokensBox.get('refresh'));
                  Navigator.pushReplacementNamed(context, RestMainRoute);
                } on DioError catch (e) {
                  showCupertinoModalPopup(
                    context: context, 
                    builder: (context){
                      return CupertinoAlertDialog(
                        title: Text('Ошибка'),
                        content: Text('Неправильный логин или пароль!'),
                        actions: [
                          CupertinoButton(child: Text('OK'), onPressed: () => Navigator.pop(context,))
                        ],
                      );
                    });
                  throw e;
                }
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