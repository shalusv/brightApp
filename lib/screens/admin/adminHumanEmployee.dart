import 'package:bright_ui/models/humanRespurces/Employee.dart';
import 'package:flutter/material.dart';

import 'addNewEmployee.dart';

class AdminHumanEmployee extends StatefulWidget {
  const AdminHumanEmployee();

  @override
  _AdminHumanEmployeeState createState() => _AdminHumanEmployeeState();
}

class _AdminHumanEmployeeState extends State<AdminHumanEmployee> {
  var employees = new Employee();
  refreshData() {
    setState() {}
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Employee'),
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: FutureBuilder(
          future: employees.fetchAll(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      elevation: 5,
                      // color: Colors.white54,
                      shadowColor: Colors.blue,
                      child: ListTile(
                        // leading: Text(
                        //   (index + 1).toString(),
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 12,
                        //     color: Colors.black54,
                        //   ),
                        // ),
                        title: Text(
                          snapshot.data[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${snapshot.data[index].position[0].toUpperCase()}${snapshot.data[index].position.substring(1)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        onTap: () {
                          // print(snapshot.data[index].positionId);
                        },
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            size: 25.0,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              // deletePostion(snapshot.data[index].positionId);
                            });
                          },
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewEmployee(refreshData),
            ),
          );
        },
        backgroundColor: Colors.blue[800],
        icon: Icon(Icons.add),
        label: Text(
          "Add New Employees",
          style: TextStyle(
            color: Colors.white60,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white60,
        elevation: 1,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
