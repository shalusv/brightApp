import 'package:bright_ui/datas/tenderData.dart';
import 'package:bright_ui/models/menuTiles.dart';
import 'package:bright_ui/widgets/appHeader.dart';
import 'package:flutter/material.dart';

class AdminReportScreen extends StatelessWidget {
  final String headerName;
  const AdminReportScreen({this.headerName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text('REPORTS'),
      ),
    );
  }
}
