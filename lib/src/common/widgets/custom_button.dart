import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/constants/padding_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = 'Введите',
  }) : super(key: key);

final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: AppPaddings.vertical,
      color: Color(0xFF4631D2),
      child: Text(text), 
      onPressed: () {}
    );
  }
}