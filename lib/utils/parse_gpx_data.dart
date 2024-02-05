import 'dart:io';

import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:xml/xml.dart';
import 'package:path/path.dart' as p;

List<LatLng> parseGpxToLatLngList(String gpxData) {
  // File gpxFile = File(path);

  // if (!gpxFile.existsSync()) {
  //   throw FileSystemException('File not found', path);
  // }

  // String gpxData = gpxFile.readAsStringSync();

  final XmlDocument xml = XmlDocument.parse(gpxData);
  final List<LatLng> coordinates = [];

  xml.findAllElements('trkpt').forEach((trkptElement) {
    final double lat = double.parse(trkptElement.getAttribute('lat')!);
    final double lon = double.parse(trkptElement.getAttribute('lon')!);

    coordinates.add(LatLng(lat, lon));
  });

  return coordinates;
}
