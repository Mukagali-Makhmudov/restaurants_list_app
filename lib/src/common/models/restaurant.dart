class Restaurant{
  Restaurant({
    required this.count,
    required this.restaurantList,
  });
  final int count;
  final List<RestaurantList> restaurantList;

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    final count = data['count'] as int;
    final restaurantListData = data['restaurants'] as List<dynamic>?;
    final restaurantList = restaurantListData != null
      ? restaurantListData.map((restaurantListDataData) => RestaurantList.fromJson(restaurantListDataData)).toList()
      : <RestaurantList>[];
    return Restaurant(
      count: count, 
      restaurantList: restaurantList,);
  }
  // Map<String, dynamic> toJson(){
  //   return {

  //     'restaurants': restaurantList.map((restaurantListData) => restaurantListData.toJson()).toList(),
  //   };
  // }
}

class RestaurantList{
  RestaurantList({
    required this.id,
    required this.isFavourite,
    required this.title,
    required this.description,
    required this.schedule,
    required this.coords,
    required this.images,
    required this.likes,
  });

  final int id;
  final bool isFavourite;
  final String title;
  final String description;
  final Schedule schedule;
  final Coord coords;
  final List<ImageClass> images;
  final List<Like> likes;

  factory RestaurantList.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final isFavourite = data['is_favourite'] as bool;
    final title = data['title'] as String;
    final description = data['description'] as String;
    final schedule = Schedule.fromJson(data['schedule']);
    final coords = Coord.fromJson(data['coords']);
    final imagesData = data['images'] as List<dynamic>;
    final images = imagesData != null
      ? imagesData.map((imagesDataData) => ImageClass.fromJson(imagesDataData)).toList()
      : <ImageClass>[];
    final likesData = data['likes'] as List<dynamic>;
    final likes = likesData != null
      ? likesData.map((likesDatadata) => Like.fromJson(likesDatadata)).toList()
      : <Like>[];
    return RestaurantList(
      id: id,
      isFavourite: isFavourite, 
      title: title, 
      description: description,
      schedule: schedule,
      coords: coords,
      images: images,
      likes: likes,
    );
  }

  // Map<String, dynamic> toJson(){
  //   return {
  //     'is_Favourite': isFavourite,
  //     'title': title,
  //     'description': description,
  //     //'schedule':  schedule = schedule.toJson(),
  //     //'coords':  coords = coords.toJson(),
  //     //'images':  images = images.toJson(),
  //   };
  // }
}

class Schedule{
  Schedule({
    required this.opening,
    required this.closing,
  });

  final String opening;
  final String closing;

  factory Schedule.fromJson(Map<String, dynamic> data) {
    final opening = data['opening'] as String;
    final closing = data['closing'] as String;
    return Schedule(
      opening: opening,
      closing: closing,
    );
  }

  // Map<String, dynamic> toJson(){
  //   return {
  //     'opening': opening,
  //     'closing': closing,
  //   };
  // }
}

class Coord{
  Coord({
    required this.longitude,
    required this.latitude,
    required this.addressName,
  });

  final double longitude;
  final double latitude;
  final String addressName;

  factory Coord.fromJson(Map<String, dynamic> data) {
    final longitude = data['longitude'] as double;
    final latitude = data['latitude'] as double;
    final addressName = data['address_name'] as String;
    return Coord(
      longitude: longitude,
      latitude: latitude,
      addressName: addressName,
    );
  }

  // Map<String, dynamic> toJson(){
  //   return {
  //     'logitude': longitude,
  //     'latitude': latitude,
  //     'address_name': addressName,
  //   };
  // }
}

class ImageClass{
  ImageClass({required this.url});

  final String url;

  factory ImageClass.fromJson(Map<String, dynamic> data) {
    final url = data['url'] as String;
    return ImageClass(
      url: url,
    );
  }

  // Map<String, dynamic> toJson(){
  //   return {
  //     'url': url,
  //   };
  // }
}

class Like {
  Like({required this.restaurantId});

  final int restaurantId;

  factory Like.fromJson(Map<String, dynamic> data){
    final restaurantId = data['restaurant_id'] as int;
    return Like(
      restaurantId: restaurantId,
    );
  }
}
