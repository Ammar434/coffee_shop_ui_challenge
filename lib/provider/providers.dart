import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'navigation_provider.dart';
import 'order_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => NavigationProvider()),
  ChangeNotifierProvider(create: (_) => OrderProvider()),
];
