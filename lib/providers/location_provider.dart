import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationProvider with ChangeNotifier {
  final String userId;

  double? latitude;
  double? longitude;
  DateTime? updatedTime;

  LocationProvider({required this.userId}) {
    _listenToLocation();
  }

  void _listenToLocation() {
    FirebaseFirestore.instance
        .collection("locations")
        .doc(userId)
        .snapshots()
        .listen((snapshot) {
          if (snapshot.exists) {
            final data = snapshot.data() as Map<String, dynamic>;
            latitude = data["latitude"];
            longitude = data["longitude"];
            updatedTime = (data["timestamp"] as Timestamp).toDate();
            notifyListeners();
          }
        });
  }
}
