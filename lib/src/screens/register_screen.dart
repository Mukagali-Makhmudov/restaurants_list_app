import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/text_field_divider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Регистрация'),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 32,),
          CustomTextField(
            placeholder: 'Логин',
          ),

          TextFieldDivider(),
          
          CustomTextField(
            placeholder: 'Телефон',
          ),

          TextFieldDivider(),

          CustomTextField(
            placeholder: 'Почта',
          ),
          
          TextFieldDivider(),

          CustomTextField(
            placeholder: 'Пароль',
          ),

          SizedBox(height: 270,),

          Padding(
            padding: AppPaddings.horizontal,
            child: CustomButton(
              text: 'Создать аккаунт',
            ),
          ),
        ],
      ),
    );
  }
}