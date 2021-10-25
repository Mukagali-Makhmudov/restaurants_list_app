import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.placeholder = 'Введите',
    this.controller,
  }) : super(key: key);

final String placeholder;
final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
      ),
      controller: controller,
      placeholder: placeholder,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16,),
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}