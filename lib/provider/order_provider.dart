import 'package:flutter/foundation.dart';

class OrderProvider extends ChangeNotifier {
  String _selectedButton = 'M';
  double _initialProductPrice = 0.0;
  double _price = 0.0;
  String _address = "";
  String _detail = "";
  int _itemQuantity = 1;

  String get selectedButton => _selectedButton;
  double get price => _price;
  String get address => _address;
  String get detail => _detail;
  int get itemQuantity => _itemQuantity;

  void setItemQuantity(int quantity) {
    _itemQuantity = quantity;
    notifyListeners();
  }

  void increaseItemQuantity() {
    _itemQuantity++;
    notifyListeners();
  }

  void decreaseItemQuantity() {
    if (_itemQuantity > 1) {
      _itemQuantity--;
    }
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setDetail(String detail) {
    _detail = detail;
    notifyListeners();
  }

  void selectButton(String button) {
    _selectedButton = button;
    updatePrice();
    notifyListeners();
  }

  void setPrice(double price) {
    _price = price;
    _initialProductPrice = price;
    notifyListeners();
  }

  void updatePrice() {
    switch (_selectedButton) {
      case 'S':
        _price = _initialProductPrice - 0.5;
        break;
      case 'M':
        _price = _initialProductPrice;
        break;
      case 'L':
        _price = _initialProductPrice + 1.5;
        break;
      default:
        _price = _initialProductPrice;
    }
  }
}
