import 'package:bright_ui/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      // body: AdminScreenSub(width: width),
      body: LoginScreen(width),
      // body: AdminHumanResources(headerName: "HUMAN RESOURCES"),
    );
  }
}
