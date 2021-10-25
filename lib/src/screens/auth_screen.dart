import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';
import 'package:flutter_application_1/src/common/models/tokens_model.dart';
import 'package:flutter_application_1/src/common/models/user_model.dart';
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
              color: AppColors.buttonColor,
              child: Text('Войти'), 
              onPressed: ()async {
                Dio dio = Dio();
                Box tokensBox = Hive.box('tokens');
                Box userBox = Hive.box('user');
                try {
                  Response responce = await dio.post(
                    'http://api.codeunion.kz/api/v1/auth/login',
                    data: {
                      'email': emailController.text,
                      'password': passwordController.text,
                    },
                  );
                  TokensModel tokensModel = TokensModel.fromJson(
                    responce.data['tokens']);
                  UserModel userModel = UserModel.fromJson(
                    responce.data['user'],
                  );
                  tokensBox.put('access', tokensModel.access);
                  tokensBox.put('refresh', tokensModel.refresh);
                  userBox.put('email', userModel.email);
                  userBox.put('nickname', userModel.nickname);
                  print(tokensBox.get('access'));
                  print(tokensBox.get('refresh'));
                  print(userBox.get('email'));
                  print(userBox.get('nickname'));
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
              color: AppColors.buttonColor,
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