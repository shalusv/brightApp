import 'package:bright_ui/widgets/appHeader.dart';
import 'package:flutter/material.dart';

class SupervisorScreen extends StatelessWidget {
  const SupervisorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            AppHeader('Supervisor'),
            Flexible(
              child: Container(
                child: Center(child: Text('Supervisor')),
                // child: GridView.count(
                //   padding: EdgeInsets.all(12),
                //   children: tilesMenu
                //       .map((eachCategory) => MenuTile(tile: eachCategory))
                //       .toList(),
                //   // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //   // maxCrossAxisExtent: 300,
                //   childAspectRatio: 2.2 / 2,
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                //   crossAxisCount: (width > 500 ? 3 : 2),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
