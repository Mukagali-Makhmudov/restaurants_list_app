import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';
import 'package:flutter_application_1/src/common/models/tokens_model.dart';
import 'package:flutter_application_1/src/common/models/user_model.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/text_field_divider.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:hive/hive.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerNicknameController = TextEditingController();
  final TextEditingController registerPhoneController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Регистрация'),
      ),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32,),
            CustomTextField(
              controller: registerNicknameController,
              placeholder: 'Логин',
            ),
      
            TextFieldDivider(),
            
            CustomTextField(
              controller: registerPhoneController,
              placeholder: 'Телефон',
            ),
      
            TextFieldDivider(),
      
            CustomTextField(
              controller: registerEmailController,
              placeholder: 'Почта',
            ),
            
            TextFieldDivider(),
      
            CustomTextField(
              controller: registerPasswordController,
              placeholder: 'Пароль',
            ),
      
            SizedBox(height: 270,),
      
            Padding(
              padding: AppPaddings.horizontal,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: AppColors.buttonColor,
                child: Text('Создать аккаунт'), 
                onPressed: ()async {
                  Dio dio = Dio();
                  Box tokensBox = Hive.box('tokens');
                  Box userBox = Hive.box('user');
                  try {
                    Response response = await dio.post(
                    'http://api.codeunion.kz/api/v1/auth/registration/customer/new',
                    data: {
                      'email': registerEmailController.text,
                      'nickname': registerNicknameController.text,
                      'phone': registerPhoneController.text,
                      'password': registerPasswordController.text,
                    },
                    );
                    
                    TokensModel tokensModel = TokensModel.fromJson(
                      response.data['tokens'],
                    );
                    UserModel userModel = UserModel.fromJson(
                      response.data['user'],
                    );
                    
                    tokensBox.put('access', tokensModel.access);
                    tokensBox.put('refresh', tokensModel.access);
                    userBox.put('email', userModel.email);
                    userBox.put('nickname', userModel.nickname);
                  
                    Navigator.pushReplacementNamed(context, RestMainRoute);
                  } on DioError catch (e) {
                    showCupertinoModalPopup(
                      context: context, 
                      builder: (context){
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text('Надо заполнить все поля!'),
                          actions: [
                            CupertinoButton(child: Text('OK'), 
                            onPressed: () => Navigator.pop(context,))
                          ],
                        );
                      });
                    throw e;
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}