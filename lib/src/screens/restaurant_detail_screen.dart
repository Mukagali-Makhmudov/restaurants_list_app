import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/models/restaurant.dart';
import 'package:flutter_application_1/src/common/widgets/text_field_divider.dart';


class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as RestaurantList;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(details.title),
        border: Border(),
        backgroundColor: AppColors.scaffoldBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 240, child: Image.network(details.images[0].url, fit: BoxFit.fill,), ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 130, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Описание"),
                Text(details.description, style: TextStyle(color: AppColors.textBlack, fontSize: 20, fontWeight: FontWeight.bold), ),
                Text('Подробнее', style: TextStyle(color: AppColors.textUnderlinedBlue, decoration: TextDecoration.underline),),
              ]),
          ),
          TextFieldDivider(),
          Container(
            height: 100, 
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(child: Icon(Icons.access_time, color: AppColors.iconBlack), alignment: PlaceholderAlignment.middle,),
                      TextSpan(
                        text: '  Работаем с ${details.schedule.opening} до ${details.schedule.closing}', 
                        style: TextStyle(fontSize: 19, color: AppColors.textBlack),
                      )
                    ]
                  )
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(child: Icon(Icons.location_on, color: AppColors.iconBlack), alignment: PlaceholderAlignment.middle),
                      TextSpan(
                        text: '  ${details.coords.addressName}',
                        style: TextStyle(fontSize: 19, color: AppColors.textBlack)
                      )
                    ]
                  )
                )   
              ],
            )
          ),  
          TextFieldDivider(),
        ],
      )
              
    );
  }
}