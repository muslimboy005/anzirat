import 'package:anzirat/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationListenerScreen extends StatelessWidget {
  const LocationListenerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    final latitude = locationProvider.latitude;
    final longitude = locationProvider.longitude;
    final updatedTime = locationProvider.updatedTime;

    return Scaffold(
      appBar: AppBar(title: const Text("Anzirat buvi app"), centerTitle: true),
      body: Center(
        child:
            latitude == null || longitude == null
                ? const Text("Lokatsiya topilmadi yoki yuklanmoqda...")
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Latitude: $latitude"),
                    Text("Longitude: $longitude"),
                    Text("Yangilangan vaqti: ${updatedTime?.toLocal()}"),
                  ],
                ),
      ),
    );
  }
}
