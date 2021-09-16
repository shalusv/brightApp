import 'package:bright_ui/models/menuTiles.dart';
import 'package:flutter/material.dart';

// MENU TILES FOR THE ADMIN
final List tilesMenu = [
  MenuTiles(
    iconUrl: 'assets/icons/icon_report.png',
    tileName: 'REPORT', color: Colors.pink,
    // screen: 'report'
  ),
  MenuTiles(
    iconUrl: 'assets/icons/icon_user.png',
    tileName: 'USER', color: Colors.teal,
    // screen: 'user'
  ),
  MenuTiles(
    iconUrl: 'assets/icons/icon_project.png',
    tileName: 'PROJECT', color: Colors.teal,
    // screen: 'project'
  ),
  MenuTiles(
    iconUrl: 'assets/icons/icon_tender.png',
    tileName: 'TENDER', color: Colors.pink,
    // screen: 'tender'
  ),
  MenuTiles(
    iconUrl: 'assets/icons/icon_purchase.png',
    tileName: 'PURCHASE', color: Colors.pink,
    // screen: 'purchase'
  ),
  MenuTiles(
      iconUrl: 'assets/icons/icon_inventory.png',
      tileName: 'INVENTORY',
      color: Colors.blueAccent
      // screen: 'inventory'
      ),
  // MenuTiles(
  //   iconUrl: 'assets/icons/icon_vendor.png',
  //   tileName: 'VENDOR', color: Colors.blueAccent,
  //   // screen: 'vendor'
  // ),
  MenuTiles(
    iconUrl: 'assets/icons/icon_order.png',
    tileName: 'Human Resources', color: Colors.blueAccent,
    // screen: 'order'
  ),
];

final Color inputFieldColor = Colors.green;
final Color inputFieldColorEnabled = Colors.green;
final Color inputFieldColorFocused = Colors.blue;
final Color inputFieldColorFilled = Colors.white10;
final Color submitButtonTextColor = Colors.white;
final TextInputType nameType = TextInputType.name;
final TextInputType emailType = TextInputType.emailAddress;
final TextInputType numberType = TextInputType.number;
final TextInputType dateType = TextInputType.datetime;
final BorderRadius inputFieldBorderRadius = BorderRadius.circular(10);
