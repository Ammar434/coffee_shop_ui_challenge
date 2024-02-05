import 'package:coffe_shop_ui_challenge/utils/custom_bottom_navigation_bar.dart';
import 'acceuil/acceuil_screen.dart';
import '../widgets/pending.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const BodyScaffold(),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomBottomNavigationBarBody(),
      body: BodyIndexedStack(),
    );
  }
}

class BodyIndexedStack extends StatelessWidget {
  const BodyIndexedStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return IndexedStack(
          index: navigationProvider.currentIndex,
          children: const [
            AcceuilScreen(),
            Pending(),
            Pending(),
            Pending(),
          ],
        );
      },
    );
  }
}
