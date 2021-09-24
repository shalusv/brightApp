import 'dart:convert';
import 'package:bright_ui/global.dart';
import 'package:bright_ui/models/humanRespurces/positon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:form_field_validator/form_field_validator.dart' as validator;

class AdminUserRoleScreen extends StatefulWidget {
  const AdminUserRoleScreen();

  @override
  _AdminUserRoleScreenState createState() => _AdminUserRoleScreenState();
}

class _AdminUserRoleScreenState extends State<AdminUserRoleScreen> {
  @override
  void initState() {
    getPositions();
    super.initState();
  }

  getPositions() async {
    var res = await http.get(Uri.parse("${apiServer}position"));
    if (res.statusCode == 200) {
      var object = jsonDecode(res.body);
      return object;
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _positionController = TextEditingController();

  Future<void> savePostion() async {
    var result = await http.post(
      // Uri.parse("http://192.168.2.2/bright/api/position/savePosition"),
      Uri.parse("${apiServer}position/savePosition"),
      body: {"position": _positionController.text},
    );
  }

  Future<void> deletePostion(int positionId) async {
    print("${positionId}1323");
    print("${apiServer}position/deletePosition/$positionId");
    var res = await http.post(
      Uri.parse("${apiServer}position/deletePosition/$positionId"),
    );
    print(res.statusCode);
    // return savePostion;
  }

  Future<void> showAddNewPositionPopup(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _positionController,
                    validator: (value) {
                      return value.isNotEmpty ? null : 'Enter valid Position';
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter a \'Position\' name'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      savePostion();
                      _positionController.text = "";
                    });

                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var positions = new Position();
    // var positions = new PositionService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Positions'),
        actions: [
          IconButton(
            onPressed: () {},
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
          // future: getPositions(),
          future: positions.fetchPositions(),
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
                        leading: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        title: Text(
                          "${snapshot.data[index].position[0].toUpperCase()}${snapshot.data[index].position.substring(1)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        onTap: () {
                          print(snapshot.data[index].positionId);
                        },
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            size: 25.0,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            // var res =
                            //     deletePostion(snapshot.data[index].positionId);
                            setState(() {
                              deletePostion(snapshot.data[index].positionId);
                            });
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) =>
                            //       AdminHumanDesignationScreen(),
                            // ));
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
          showAddNewPositionPopup(context);
        },
        backgroundColor: Colors.blue[800],
        icon: Icon(Icons.add),
        label: Text(
          "Create New Position",
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

void deletePopup() {}

class AddNewPosition extends StatelessWidget {
  const AddNewPosition();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _positionController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Positions'),
          actions: [
            IconButton(
              onPressed: () {},
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _positionController,
                  validator: (value) {
                    return value.isNotEmpty ? null : 'Enter valid Position';
                  },
                  decoration:
                      InputDecoration(hintText: 'Enter a \'Position\' name'),
                ),
                TextButton(
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    //   savePostion();
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => AdminHumanDesignationScreen(),
                    //   ));
                    //   // Navigator.of(context).pop();
                    // }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ));
  }
}
