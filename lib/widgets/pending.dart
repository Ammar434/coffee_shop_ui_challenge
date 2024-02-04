import '../utils/colors.dart';
import '../utils/constants.dart';
import 'package:flutter/material.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coming Soon',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                )),
      ),
      body: Padding(
        padding: EdgeInsets.all(kPadding),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.coffee,
              size: 100,
              color: primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              'This part of the application will be build later.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Stay tuned for updates.',
              style: TextStyle(
                fontSize: 16,
                color: hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
