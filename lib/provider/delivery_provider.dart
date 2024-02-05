// import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';

// import '../datas/temporary_map_data.dart';

enum DeliveryStep {
  findingDriver,
  movingToRestaurant,
  preparing,
  movingToHome,
  delivered,
}

// class DeliveryProvider with ChangeNotifier {
//   DeliveryStep _currentStep = DeliveryStep.findingDriver;
//   int _timeToDeliver = 0;
//   final Duration _durationToGoToRestaurant = const Duration(seconds: 12);
//   final Duration _durationToGoToHome = const Duration(seconds: 14);
//   final Duration _durationToStayAtRestaurant = const Duration(seconds: 14);
//   final Duration _durationToFindDriver = const Duration(seconds: 4);
//   final Duration _durationToPrepare = const Duration(seconds: 4);

//   final int _timeSpend = 0;

//   DeliveryStep get currentStep => _currentStep;
//   int get timeToDeliver => _timeToDeliver;
//   Duration get durationToGoToRestaurant => _durationToGoToRestaurant;
//   Duration get durationToGoToHome => _durationToGoToHome;
//   Duration get durationToStayAtRestaurant => _durationToStayAtRestaurant;
//   Duration get durationToFindDriver => _durationToFindDriver;
//   Duration get durationToPrepare => _durationToPrepare;

//   int get timeSpend => _timeSpend;

//   void calculateTimeToDeliver() {
//     _timeToDeliver = _durationToStayAtRestaurant.inSeconds + _durationToGoToHome.inSeconds + _durationToGoToRestaurant.inSeconds;
//     notifyListeners();
//   }

//   Duration getAnimationDuration(DeliveryStep deliveryStep) {
//     switch (deliveryStep) {
//       case DeliveryStep.findingDriver:
//         return _durationToFindDriver;
//       case DeliveryStep.movingToRestaurant:
//         return _durationToGoToRestaurant;
//       case DeliveryStep.preparing:
//         return _durationToPrepare;
//       case DeliveryStep.movingToHome:
//         return _durationToGoToHome;
//       case DeliveryStep.delivered:
//         return const Duration(seconds: 0);
//     }
//   }

//   void moveToNextStep() {
//     switch (_currentStep) {
//       case DeliveryStep.findingDriver:
//         _currentStep = DeliveryStep.movingToRestaurant;
//         break;
//       case DeliveryStep.movingToRestaurant:
//         _currentStep = DeliveryStep.preparing;
//         break;
//       case DeliveryStep.preparing:
//         _currentStep = DeliveryStep.movingToHome;
//         break;
//       case DeliveryStep.movingToHome:
//         _currentStep = DeliveryStep.delivered;
//         break;
//       case DeliveryStep.delivered:
//         break;
//     }
//     notifyListeners();
//   }

//   void decrementTimeToDeliver() {
//     _timeToDeliver--;
//     notifyListeners();

//     // _timeSpend++;
//     // print(_timeToDeliver);
//     // if (_timeSpend > _durationToFindDriver.inSeconds && _currentStep == DeliveryStep.findingDriver) {
//     //   calculateTimeToDeliver();
//     //   moveToNextStep();
//     // }
//     // if (_timeSpend > _durationToGoToRestaurant.inSeconds + _durationToFindDriver.inSeconds && _currentStep == DeliveryStep.movingToRestaurant) {
//     //   moveToNextStep();
//     // }

//     // if (_timeSpend > _durationToGoToRestaurant.inSeconds + _durationToFindDriver.inSeconds + _durationToStayAtRestaurant.inSeconds && _currentStep == DeliveryStep.preparing) {
//     //   moveToNextStep();
//     // }

//     // if (_timeSpend > _durationToGoToRestaurant.inSeconds + _durationToFindDriver.inSeconds + _durationToStayAtRestaurant.inSeconds + _durationToGoToHome.inSeconds &&
//     //     _currentStep == DeliveryStep.movingToHome) {
//     //   moveToNextStep();
//     // }
//   }

//   void resetProvider() {
//     _currentStep = DeliveryStep.findingDriver;
//     _timeToDeliver = 0;
//     notifyListeners();
//   }
// }
