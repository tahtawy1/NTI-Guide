import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SiteMapWidget extends StatelessWidget {
  const SiteMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.title,
  });

  final double latitude;
  final double longitude;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GoogleMap(
        onTap: (argument) {},
        // 🔒 قفل كل التفاعل
        scrollGesturesEnabled: false,
        zoomGesturesEnabled: false,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,

        // UI تقليل
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,

        // 🚀 تحسين أداء
        liteModeEnabled: true, // مهم جدًا (Android فقط)
        buildingsEnabled: false,
        trafficEnabled: false,
        indoorViewEnabled: false,

        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('NTI'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: title),
          ),
        },
      ),
    );
  }
}
