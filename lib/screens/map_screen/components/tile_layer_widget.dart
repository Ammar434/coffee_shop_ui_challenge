import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class TileLayerWidget extends StatelessWidget {
  const TileLayerWidget({super.key, required this.urlTemplate});

  final String urlTemplate;

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      urlTemplate: urlTemplate,
    );
  }
}
