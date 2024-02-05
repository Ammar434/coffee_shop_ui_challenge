import 'dart:async';

import 'package:coffe_shop_ui_challenge/datas/temporary_map_data.dart';
import 'package:coffe_shop_ui_challenge/screens/map_screen/components/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'components/bottom_sheet.dart';
import 'components/positionned_button.dart';

const int animationDurationInSeconds = 120;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  int elapsedTimeInSeconds = animationDurationInSeconds;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: animationDurationInSeconds),
      vsync: this,
    );

    animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // decrement elapsed time based on timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTimeInSeconds--;
      });
      if (elapsedTimeInSeconds < 1) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController();

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            mapController: mapController,
            completePath: completePath,
            restaurantToHome: restaurantToHome,
            animationController: animationController,
          ),
          PositionedButton(
            mapController: mapController,
            isBack: false,
          ),
          PositionedButton(
            mapController: mapController,
            isBack: true,
          ),
          BottomSheetWidget(
            elapsedTimeInSeconds: elapsedTimeInSeconds,
            animationController: animationController,
          ),
        ],
      ),
    );
  }
}
