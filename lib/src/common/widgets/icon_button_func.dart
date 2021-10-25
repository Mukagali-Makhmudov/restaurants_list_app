import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconButtonFunc extends StatelessWidget {
  const IconButtonFunc( {
    Key? key,
    required this.isFavourite,
    required this.index
  }) : super(key: key);

  final bool isFavourite;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(isFavourite, index), 
      icon: Icon(Icons.favorite_border),
      color: isFavourite ? Colors.red : Colors.black,
      iconSize: 33,
    );
  }
}


setState(bool isFavourite, int index) async {
  Dio dio = Dio();
  if(isFavourite == false){
    print(index);
    Response response = await dio.post('http://api.codeunion.kz/api/v1/likes/new',
    data: {'restaurant_id': index},
    options: Options(
    headers: {
      'Authorization': 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUxLCJpc1JlZnJlc2giOmZhbHNlLCJpYXQiOjE2MzQ1NDYwNDgsImV4cCI6MTYzNTc1NTY0OH0.tkoZ-0raSzavce6MSjaqrfHb_0rZ7PeZrut7VFPKqI8',
    }
  )
    );
    return isFavourite;
  } else {
    print(index);
    Response response = await dio.delete('http://api.codeunion.kz/api/v1/likes/${index}',
    options: Options(
    headers: {
      'Authorization': 'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUxLCJpc1JlZnJlc2giOmZhbHNlLCJpYXQiOjE2MzQ1NDYwNDgsImV4cCI6MTYzNTc1NTY0OH0.tkoZ-0raSzavce6MSjaqrfHb_0rZ7PeZrut7VFPKqI8',
    }
  )
  );
    return isFavourite;
  }
}