import 'dart:ui';
import 'package:coffe_shop_ui_challenge/screens/map_screen/components/marker_layer.dart';
import 'package:coffe_shop_ui_challenge/screens/map_screen/components/polyline_layer.dart';
import 'package:coffe_shop_ui_challenge/screens/map_screen/components/tile_layer_widget.dart';
import 'package:coffe_shop_ui_challenge/screens/map_screen/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../datas/temporary_map_data.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.mapController,
    required this.completePath,
    required this.restaurantToHome,
    required this.animationController,
  });

  final MapController mapController;
  final List<LatLng> completePath;
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
    driverLocation = widget.completePath.first;

    widget.animationController.addListener(() {
      if (widget.animationController.value < 0.25) {
        widget.mapController.move(home, 18);
      }
      if (widget.animationController.value > 0.25) {
        widget.mapController.move(driverLocation, 18);
      }

      setState(() {
        driverLocation = getAnimatedLocation(widget.animationController.value);
      });
    });

    widget.animationController.duration = const Duration(
      seconds: animationDurationInSeconds,
    );
    widget.animationController.forward();
  }

  LatLng getAnimatedLocation(double t) {
    int index = (t * (widget.completePath.length - 1)).floor();
    index = index.clamp(0, widget.completePath.length - 2);

    LatLng start = widget.completePath[index];
    LatLng end = widget.completePath[index + 1];
    double localT = t * (widget.completePath.length - 1) - index;

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
        const TileLayerWidget(urlTemplate: mapTileUrl),
        PolylineLayerWidget(
          driverToRestaurant: driverToRestaurant,
          restaurantToHome: widget.restaurantToHome,
          animationController: widget.animationController,
        ),
        MarkerLayerWidget(
          driverLocation: driverLocation,
        ),
      ],
    );
  }
}
