
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: CupertinoColors.white,
        middle: const Text('Профиль', ),
      ),
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(CupertinoIcons.person_crop_circle, size: 100, color: CupertinoColors.black,),
            Text('Махмудов Мукагали', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('mukagali.mahmudov@gmail.com', textAlign: TextAlign.center,),
            Container(
              color: CupertinoColors.white,
              child: Expanded(
                child: CupertinoButton(
                  alignment: Alignment.topLeft,
                  onPressed: (){
                  },
                  child: Text(
                    'Выйти',
                    style: TextStyle(color: CupertinoColors.systemRed),
                    ),
                ),
              ),
                
                ),
          ],
        ),
      ),
      );
  }
}