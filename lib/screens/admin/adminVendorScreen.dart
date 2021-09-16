import 'package:bright_ui/datas/tenderData.dart';
import 'package:bright_ui/models/menuTiles.dart';
import 'package:bright_ui/widgets/appHeader.dart';
import 'package:flutter/material.dart';

class AdminVendorScreen extends StatelessWidget {
  final String headerName;
  const AdminVendorScreen({this.headerName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text('PROJECTS'),
      ),
    );
  }
}
