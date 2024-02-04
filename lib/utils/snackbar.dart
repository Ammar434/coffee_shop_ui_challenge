// for displaying snackbars
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

showSnackBarBuildLater(BuildContext context) {
  FocusScope.of(context).unfocus();
  return ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("This feature will be build later 🥲"),
    ),
  );
}
