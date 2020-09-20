import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  final String restaurantName;
  final String restaurantImage;

  Restaurant({this.restaurantName, this.restaurantImage});

  static CollectionReference getCollection() {
    return FirebaseFirestore.instance.collection("restaurants");
  }

  Map<String, String> toMap() {
    return <String, String>{
      "restaurantName": this.restaurantName,
      "restaurantImage": this.restaurantImage,
    };
  }
}
