import 'package:bright_ui/models/menuTiles.dart';
import 'package:bright_ui/screens/admin/adminHumanResourcesScreen.dart';
import 'package:bright_ui/screens/admin/adminInventoryScreen.dart';
import 'package:bright_ui/screens/admin/adminOrderScreen.dart';
import 'package:bright_ui/screens/admin/adminProjectScreen.dart';
import 'package:bright_ui/screens/admin/adminPurchaseScreen.dart';
import 'package:bright_ui/screens/admin/adminReportScreen.dart';
import 'package:bright_ui/screens/admin/adminTenderScreen.dart';
import 'package:bright_ui/screens/admin/adminUserScreen.dart';
import 'package:bright_ui/screens/admin/adminVendorScreen.dart';
import 'package:flutter/material.dart';

class AdminTilePage extends StatelessWidget {
  final MenuTiles tile;

  AdminTilePage({this.tile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(this.tile.tileName),
    );
  }
}

_callPage(String tileName) {
  switch (tileName) {
    case 'REPORT':
      return AdminReportScreen(headerName: tileName);
      break;
    case 'USER':
      return AdminUserScreen(headerName: tileName);
      break;
    case 'PROJECT':
      return AdminProjectScreen(headerName: tileName);
      break;
    case 'TENDER':
      return AdminTenderScreen(headerName: tileName);
      break;
    case 'INVENTORY':
      return AdminInventoryScreen(headerName: tileName);
      break;
    case 'PURCHASE':
      return AdminPurchaseScreen(headerName: tileName);
      break;
    case 'VENDOR':
      return AdminVendorScreen(headerName: tileName);
      break;
    case 'ORDER':
      return AdminOrderScreen(headerName: tileName);
      break;
    case 'Human Resources':
      return AdminHumanResourcesScreen(headerName: tileName);
      break;
    default:
  }
}
