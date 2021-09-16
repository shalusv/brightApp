import 'package:bright_ui/datas/tenderData.dart';
import 'package:bright_ui/models/menuTiles.dart';
import 'package:bright_ui/models/tender.dart';
import 'package:bright_ui/screens/admin/addNewTender.dart';
import 'package:bright_ui/screens/admin/tenderViewScreen.dart';
import 'package:bright_ui/screens/adminScreen.dart';
import 'package:bright_ui/screens/adminScreen.dart';
import 'package:bright_ui/widgets/appHeader.dart';
import 'package:flutter/material.dart';

import '../adminScreen.dart';

class AdminTenderScreen extends StatelessWidget {
  final String headerName;
  int selectPage = 0;
  AdminTenderScreen({this.headerName});

  @override
  Widget build(BuildContext context) {
    List<Object> pages = [
      // AdminScreen(),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(headerName),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewTender(),
                ));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  'All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Approved',
                  style: TextStyle(
                    color: Colors.greenAccent[400],
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'In Process',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 12,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Rejected',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddNewTender(),
            ));
          },
          icon: Icon(Icons.add),
          label: Text('Add New Tender'),
        ),
        body: TabBarView(
          children: [
            _listFilter("All"),
            _listFilter("Approved"),
            _listFilter("In Process"),
            _listFilter("Rejected"),
          ],
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
      ),
    );
  }
}

_listFilter(String status) {
  List<Tender> filteredTender = [];
  tenderList.forEach((tender) {
    if (status == 'All') {
      filteredTender.add(tender);
    } else {
      if (tender.status == status) {
        filteredTender.add(tender);
      }
    }
  });

  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: filteredTender.length,
              itemBuilder: (context, index) {
                Tender tender = filteredTender[index];
                return InkWell(
                  onTap: () {
                    print('Tapped to ${tender.name}');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TenderViewScreen(
                          tender: tender,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Text('${index + 1}'),
                      title: Text(tender.name),
                      subtitle: Text(tender.id),
                      trailing: GestureDetector(
                        onTap: () {
                          print("object");
                        },
                        child: PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: Colors.blue,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem<String>(
                              value: tender.id,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 15,
                                  ),
                                  Text(
                                    'View Tender',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: tender.id,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 15,
                                  ),
                                  Text(
                                    'Edit Tender',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: tender.id,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 15,
                                  ),
                                  Text(
                                    'Delete from List',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
