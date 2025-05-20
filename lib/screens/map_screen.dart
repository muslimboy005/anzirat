import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CameraPosition intialPosition = CameraPosition(
    target: LatLng(41.2753, 69.2048),
    zoom: 14,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: intialPosition,
      markers: {
        Marker(markerId: MarkerId("1"), position: LatLng(41.2753, 69.2048)),
      },
      onMapCreated: (GoogleMapController controller) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(intialPosition),
        );
      },
    );
  }
}
