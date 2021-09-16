import 'package:bright_ui/datas/datas.dart';
import 'package:bright_ui/widgets/appHeader.dart';
import 'package:bright_ui/widgets/menuTile.dart';
import 'package:flutter/material.dart';

class AdminScreenSub extends StatelessWidget {
  double width;
  AdminScreenSub(this.width);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppHeader('DASHBOARD'),
            Flexible(
              child: Center(
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(12),
                  children: tilesMenu
                      .map((eachCategory) => MenuTile(tile: eachCategory))
                      .toList(),
                  // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  // maxCrossAxisExtent: 300,
                  childAspectRatio: 2.2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: (width > 500 ? 3 : 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
