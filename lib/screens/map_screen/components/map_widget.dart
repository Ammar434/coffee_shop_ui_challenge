import 'dart:ui';

import 'package:coffe_shop_ui_challenge/screens/map_screen/map_screen.dart';
import 'package:coffe_shop_ui_challenge/utils/colors.dart';
import 'package:coffe_shop_ui_challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../datas/temporary_map_data.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.mapController,
    required this.driverToRestaurant,
    required this.restaurantToHome,
    required this.animationController,
  });

  final MapController mapController;
  final List<LatLng> driverToRestaurant;
  final List<LatLng> restaurantToHome;
  final AnimationController animationController;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with SingleTickerProviderStateMixin {
  late LatLng driverLocation;

  @override
  void initState() {
    super.initState();
    driverLocation = widget.driverToRestaurant.first;

    widget.animationController.addListener(() {
      if (widget.animationController.value < 0.2) {
        widget.mapController.move(home, 18);
      }
      if (widget.animationController.value > 0.2) {
        widget.mapController.move(driverLocation, 18);
      }

      setState(() {
        driverLocation = getAnimatedLocation(widget.animationController.value);
      });
    });

    widget.animationController.duration = const Duration(
      seconds: animationDurationInSeconds,
    ); // Set your desired duration here
    widget.animationController.forward();
  }

  LatLng getAnimatedLocation(double t) {
    int index = (t * (widget.driverToRestaurant.length - 1)).floor();
    index = index.clamp(0, widget.driverToRestaurant.length - 2); // Ensure index is within valid range

    LatLng start = widget.driverToRestaurant[index];
    LatLng end = widget.driverToRestaurant[index + 1];
    double localT = t * (widget.driverToRestaurant.length - 1) - index;

    double lat = lerpDouble(start.latitude, end.latitude, localT)!;
    double lng = lerpDouble(start.longitude, end.longitude, localT)!;

    return LatLng(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        initialCenter: home,
        initialZoom: 18,
        maxZoom: 22,
        minZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: mapTileUrl,
        ),
        PolylineLayer(
          polylines: [
            if (widget.animationController.value < 0.6)
              Polyline(
                points: widget.driverToRestaurant,
                strokeWidth: 4.0,
                isDotted: true,
                color: Colors.black,
              ),
            if (widget.animationController.value > 0.6)
              Polyline(
                points: widget.restaurantToHome,
                color: primaryColor,
                strokeWidth: 4.0,
              ),
          ],
        ),
        MarkerLayer(
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
        )
      ],
    );
  }
}

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
