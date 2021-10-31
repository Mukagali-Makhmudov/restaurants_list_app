import 'package:dio/dio.dart';
import 'package:flutter_application_1/src/common/models/restaurant.dart';

Future<Restaurant> getData() async {
  Dio dio = Dio();
  Response response = await dio.get('http://api.codeunion.kz/api/v1/restaurants/all?page=1&perPage=10',
  options: Options(
    headers: {
      'Authorization': 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUxLCJpc1JlZnJlc2giOmZhbHNlLCJpYXQiOjE2MzQ1NDYwNDgsImV4cCI6MTYzNTc1NTY0OH0.tkoZ-0raSzavce6MSjaqrfHb_0rZ7PeZrut7VFPKqI8',
    }
  )
  );
  return Restaurant.fromJson(response.data);
}

Future<Restaurant> getDataFavRest() async {
  Dio dio = Dio();
  Response response = await dio.get('http://api.codeunion.kz/api/v1/likes/all',
  options: Options(
    headers: {
      'Authorization': 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUxLCJpc1JlZnJlc2giOmZhbHNlLCJpYXQiOjE2MzQ1NDYwNDgsImV4cCI6MTYzNTc1NTY0OH0.tkoZ-0raSzavce6MSjaqrfHb_0rZ7PeZrut7VFPKqI8',
    }
  )
  );
  return Restaurant.fromJson(response.data);
}
