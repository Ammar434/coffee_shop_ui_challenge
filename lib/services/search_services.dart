import 'package:coffe_shop_ui_challenge/models/coffee.dart';

import '../datas/temporary_data.dart';

class SearchMethods {
//Get coffee sugestion based on list
  static List<Coffee> find(String search) {
    List<Coffee> list = coffeeList.where((element) => element.name.toLowerCase().contains(search.toLowerCase())).toList() as List<Coffee>;
    return list;
  }
}
