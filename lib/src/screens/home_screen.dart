import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/constants/color_constants.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        //bottom: false,
        child: ListView(
          children: 
              [Column(
              children: <Widget>[Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: CupertinoSearchTextField(
                  placeholder: 'Поиск',
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.systemGrey),
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


class RestaurantsList extends StatefulWidget {

  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  final List<String> restaurantName = ['Be Famous', 'Giginova', 'Narsharab', 'Pinta', 'Sansara', 'Thai-in'];

  final List<String> restaurantDescription = [
  'Новый модный караоке бар с самыми крутыми и уютными кабинками в городе. Каждый найдет здесь кабинку по своему размеру и вкусе. Заведение впервые в Десятке самых просматриваемых на RestoLife. ',
  'Ресторан грузинской кухни от Гиги традиционно является одним из самых любимых ресторанчиков жителями нашего города.',
  'Шикарный ресторан азербайджанской кухни со сказочным интерьером и невероятной красоты летней террасой в самом центре города - впервые в Десятке самых популярных заведений Алматы.',
  'Самой популярной Пинтой, а заодно и резидентом десятки самых популярных заведений Алматы, стал ресторан Пинта в гостинице Казахстан.',
  'Новый модный лаундж-бар с самыми крутыми кальянами в городе впервые в нашей десятке самых посещаемых заведений на портале RestoLife.',
  'Ресторан тайской кухни побалует вас самыми вкусными блюдами.'];

  final List<String> restaurantAddress = [
  'г. Алматы, ул. Кожабекова, 21/1 (напротив MEGA Almaty)',
  'г. Алматы, Богенбай батыра, 142 (уг. Чайковского, БЦ Кайсар Тауэр)',
  'г. Алматы, пр. Достык, 63 (уг.ул. Шевченко)',
  'г. Алматы, пр. Достык, 52/2 (уг. Курмангазы, Гостиница Казахстан)',
  'г. Алматы, ул. Наурызбай батыра, 85 (уг. Кабанбай батыра)',
  'г. Алматы, мкрн. ​Керемет, 7 к43'
  ];

  final restaurantImage = [Image.asset('assets/beFamous.jpg'), Image.asset('assets/giginova.jpg'),Image.asset('assets/narsharab.jpg'), 
                                        Image.asset('assets/pinta.jpg'), Image.asset('assets/sansara.jpg'), Image.asset('assets/thai-in.jpg')];
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: restaurantName.length,
      itemBuilder: (context, index){
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
              [ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Container(
                  child: restaurantImage[index]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(restaurantName[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(restaurantDescription[index], style: TextStyle(fontSize: 16), softWrap: false, overflow: TextOverflow.ellipsis,),
                          Text(restaurantAddress[index], style: TextStyle(fontSize: 16), softWrap: false, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => isFavorite = !isFavorite), 
                      icon: Icon(Icons.favorite_border),
                      color: isFavorite ? Colors.red : Colors.black,
                      iconSize: 33,
        
                      )
                  ],
                ),
              ),
              ],
              ),
              
          );
        
      }, 
      );
  }
}

