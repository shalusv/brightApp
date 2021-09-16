import 'package:flutter/material.dart';

import './screens/homeScreen.dart';
import 'defaults/defaults.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BRIGHT CONSTRUCTION',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white60,
        iconTheme: IconThemeData(
          color: iconColor,
        ),
        // primaryColor: Colors.black54,
      ),
      home: HomeScreen(),
    );
  }
}
