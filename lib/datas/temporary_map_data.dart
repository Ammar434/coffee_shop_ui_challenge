import 'package:coffe_shop_ui_challenge/datas/raw_gpx_file.dart';
import 'package:latlong2/latlong.dart';

import '../utils/parse_gpx_data.dart';

final List<LatLng> completePath = driverToRestaurant + restaurantToHome;

final List<LatLng> driverToRestaurant = parseGpxToLatLngList(rawdDiverToRestaurant);

final List<LatLng> restaurantToHome = parseGpxToLatLngList(rawRestaurantToHome);

final LatLng home = restaurantToHome.last;
final LatLng restaurant = restaurantToHome.first;

const String mapTileUrl =
    'https://api.mapbox.com/styles/v1/ammar434/cls8mgyee019301pl22emc6dd/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW1tYXI0MzQiLCJhIjoiY2w1aWlnaTdkMDhoODNidDh0dXRoMHBnbCJ9.kwYEeCiipd3pZPOFpNPmJg';
