// File: components/marker_layer.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import '../../../datas/temporary_map_data.dart';
import '../../../widgets/rounded_icon.dart';

class MarkerLayerWidget extends StatelessWidget {
  const MarkerLayerWidget({super.key, required this.driverLocation});

  final LatLng driverLocation;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          width: 40.sp,
          height: 40.sp,
          point: driverLocation,
          child: const RoundedIcon(
            icon: Icons.motorcycle,
          ),
        ),
        Marker(
          width: 40.sp,
          height: 40.sp,
          point: restaurant,
          //Circle icon
          child: const RoundedIcon(
            icon: Icons.coffee,
          ),
        ),
        Marker(
          width: 40.sp,
          height: 40.sp,
          point: home,
          child: const RoundedIcon(
            icon: Icons.home,
          ),
        ),
      ],
    );
  }
}
