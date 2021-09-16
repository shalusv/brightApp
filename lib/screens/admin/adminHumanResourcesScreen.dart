import 'package:bright_ui/screens/admin/addNewTender.dart';
import 'package:bright_ui/screens/admin/adminHumanEmployee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'adminHumanDesignationScreen.dart';

class AdminHumanResourcesScreen extends StatefulWidget {
  final String headerName;
  const AdminHumanResourcesScreen({this.headerName});

  @override
  _AdminHumanResourcesScreenState createState() =>
      _AdminHumanResourcesScreenState();
}

class _AdminHumanResourcesScreenState extends State<AdminHumanResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.headerName),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => AddNewProject(),
              // ));
            },
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.blue[700],
                  ),
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminHumanEmployee(),
                      ));
                    },
                    child: hrMenuTiles(Icons.group, "Employee"),
                  ),
                  hrMenuTiles(Icons.check, "Attendance"),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminHumanDesignationScreen(),
                      ));
                    },
                    child: hrMenuTiles(Icons.perm_identity, "Positions"),
                  ),
                  hrMenuTiles(Icons.list_alt, "Leave Requests"),
                ],
                staggeredTiles: [
                  StaggeredTile.extent(1, 130),
                  StaggeredTile.extent(1, 130),
                  StaggeredTile.extent(1, 130),
                  StaggeredTile.extent(1, 130),
                  StaggeredTile.extent(2, 130),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNewTender(),
          ));
        },
        backgroundColor: Colors.blue[800],
        icon: Icon(Icons.add),
        label: Text(
          "Add New Employee",
          style: TextStyle(
            color: Colors.white60,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Material hrMenuTiles(IconData icon, String heading) {
    return Material(
      color: Colors.white,
      elevation: 23,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(5),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: Colors.lightBlueAccent,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
