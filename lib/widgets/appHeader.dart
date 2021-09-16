import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String appHeaderName ;

  const AppHeader(this.appHeaderName);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
            title: Text(appHeaderName),
            leading: Icon(Icons.menu),
            backgroundColor: Colors.blueAccent[400],
            toolbarHeight: 80,
            actions: <Widget>[
          
          IconButton(
            iconSize: 50,
            
            icon: Icon(Icons.account_circle),
            onPressed: () => {},
          )
        ]));
  }
}
