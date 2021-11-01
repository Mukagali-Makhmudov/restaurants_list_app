import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
import 'package:flutter_application_1/src/common/models/restaurant.dart';
import 'package:flutter_application_1/src/common/widgets/icon_button_func.dart';
import 'package:flutter_application_1/src/screens/restaurant_detail_screen.dart';
import 'package:flutter_application_1/src/service/service.dart';
import 'package:hive/hive.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: CupertinoSearchTextField(
                    placeholder: 'Поиск',
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.scaffoldBackground,
                    ),
                  ),
                ), 
                RestaurantsList()]),
              ],
          ),
        )
      );
      }
}


class RestaurantsList extends StatelessWidget {
  const RestaurantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box tokensBox = Hive.box('tokens');
    return FutureBuilder<Restaurant>(
        future: getData(tokensBox.get('access')),
        builder: (BuildContext context, AsyncSnapshot<Restaurant> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting: return const Text('Loading...');
                default: 
                  if (snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  }
                  else {
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.restaurantList.length,
                      itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => RestaurantDetailScreen(),
                              settings: RouteSettings(arguments: snapshot.data!.restaurantList[index]),
                            )
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                child: Container(
                                  child: Image.network(snapshot.data!.restaurantList[index].images[0].url, fit: BoxFit.fill, height: 250))),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                                height: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(snapshot.data!.restaurantList[index].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                              Text(snapshot.data!.restaurantList[index].description, style: TextStyle(fontSize: 16), softWrap: false, overflow: TextOverflow.ellipsis,),
                                              Text(snapshot.data!.restaurantList[index].coords.addressName, style: TextStyle(fontSize: 16), softWrap: false, overflow: TextOverflow.ellipsis,),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButtonFunc(index: snapshot.data!.restaurantList[index].id, isFavourite: snapshot.data!.restaurantList[index].isFavourite,)
                                  ],
                                ),
                              ),
                            ],
                          ),    
                        ),
                      );
                    }, 
                  );
                }
              }
            }
          );
        }
}

