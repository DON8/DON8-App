import 'package:cloud_firestore/cloud_firestore.dart';

class Campaign {
  final String campaignName;
  final String imageUrl;
  final String campaignId;
  final String campaignOwner;
  List<Map<String, String>> details;
  List<String> conditions;

  Campaign({
    this.campaignName,
    this.imageUrl,
    this.campaignId,
    this.campaignOwner,
    this.details,
    this.conditions,
  });

  static CollectionReference getCollection() {
    return FirebaseFirestore.instance.collection("campaigns");
  }

  loadConditions() async {
    final snapshot = await FirebaseFirestore.instance
        .doc("campaigns/" + this.campaignId)
        .get();

    this.conditions = snapshot.get("conditions");
  }

  Future<List<Map<String, String>>> loadDetails() async {
    final snapshot = await FirebaseFirestore.instance
        .doc("campaigns/" + this.campaignId)
        .get();

    final theItems = snapshot.data()['details'].map((i) {
      final z = Map<String, String>.from(i);
      return z;
    }).toList();

    this.details = List<Map<String, String>>.from(theItems);
    return this.details;
  }
}
