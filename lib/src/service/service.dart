import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/models/restaurant.dart';
import 'package:hive/hive.dart';

Future<Restaurant> getData(String authToken) async {
  Dio dio = Dio();
  Response response = await dio.get('http://api.codeunion.kz/api/v1/restaurants/all?page=1&perPage=10',
  options: Options(
    headers: {
      'Authorization': 'Token $authToken',
    }
  )
  );
  return Restaurant.fromJson(response.data);
}

Future<Restaurant> getDataFavRest(String authToken) async {
    Dio dio = Dio();
    Response response = await dio.get('http://api.codeunion.kz/api/v1/likes/all',
    options: Options(
      headers: {
        'Authorization': 'Token $authToken',
      }
    )
    );
    return Restaurant.fromJson(response.data);
}
