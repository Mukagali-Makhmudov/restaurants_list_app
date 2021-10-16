import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:hive/hive.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {

  final Box userBox = Hive.box('user');
  final Box tokensBox = Hive.box('tokens');

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
            Text(userBox.get('nickname'), textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text(userBox.get('email'), textAlign: TextAlign.center,),
            Container(
              color: CupertinoColors.white,
              child: Expanded(
                child: CupertinoButton(
                  alignment: Alignment.topLeft,
                  onPressed: (){
                    tokensBox.delete('access');
                    tokensBox.delete('refresh');
                    userBox.delete('email');
                    userBox.delete('nickname');
                    Navigator.of(context, rootNavigator:true).pushReplacementNamed(AuthRoute);
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