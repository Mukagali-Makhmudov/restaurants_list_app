import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/domain/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[CupertinoSearchTextField(), 
          Expanded(child: RestaurantsList())]),
        ),
      )
    );
    }
}

class RestaurantsList extends StatelessWidget {

  final List<String> restaurantName = ['Be Famous', 'Giginova', 'Narsharab', 'Pinta', 'Sansara', 'Thai-in'];
  final List<String> restaurantDescription = ['Be Famous', 'Giginova', 'Narsharab', 'Pinta', 'Sansara', 'Thai-in'];
  final restaurantImage = [Image.asset('assets/beFamous.jpg'), Image.asset('assets/giginova.jpg'),Image.asset('assets/narsharab.jpg'), 
                                        Image.asset('assets/pinta.jpg'), Image.asset('assets/sansara.jpg'), Image.asset('assets/thai-in.jpg')];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: restaurantName.length,
      itemBuilder: (context, index){
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            children: 
              [Container(child: restaurantImage[index]),
              ListTile(title: Text(restaurantName[index]), subtitle: Text(restaurantDescription[index]),)
            ],
          ),
        );
      }, 
      );
  }
}

/*abstract class RestaurantList {
  Widget buildImage(BuildContext context)
  Widget buildTittle(BuildContext context)
}

class Name implements RestaurantList{
  
  @override
  Widget @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: ,
    );
  }
}*/