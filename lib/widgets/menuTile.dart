import 'package:bright_ui/models/menuTiles.dart';
import 'package:bright_ui/screens/admin/adminTilePage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuTile extends StatelessWidget {
  MenuTiles tile;
  MenuTile({this.tile});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tapped to ${this.tile.tileName}');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminTilePage(tile: this.tile)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: tile.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(tile.iconUrl),
              height: 80,
            ),
            Center(
              child: Text(
                tile.tileName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
