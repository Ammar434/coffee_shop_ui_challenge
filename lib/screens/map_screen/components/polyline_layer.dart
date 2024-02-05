// File: components/polyline_layer.dart
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PolylineLayerWidget extends StatelessWidget {
  const PolylineLayerWidget({
    super.key,
    required this.driverToRestaurant,
    required this.restaurantToHome,
    required this.animationController,
  });

  final List<LatLng> driverToRestaurant;
  final List<LatLng> restaurantToHome;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return PolylineLayer(
      polylines: [
        if (animationController.value < 0.6)
          Polyline(
            points: driverToRestaurant,
            strokeWidth: 4.0,
            isDotted: true,
            color: Colors.black,
          ),
        if (animationController.value > 0.6)
          Polyline(
            points: restaurantToHome,
            color: primaryColor,
            strokeWidth: 4.0,
          ),
      ],
    );
  }
}
