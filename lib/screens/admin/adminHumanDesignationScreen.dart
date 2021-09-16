import 'dart:convert';
import 'package:bright_ui/myUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:form_field_validator/form_field_validator.dart' as validator;

class AdminHumanDesignationScreen extends StatefulWidget {
  const AdminHumanDesignationScreen();

  @override
  _AdminHumanDesignationScreenState createState() =>
      _AdminHumanDesignationScreenState();
}

class _AdminHumanDesignationScreenState
    extends State<AdminHumanDesignationScreen> {
  @override
  void initState() {
    getPositions();
    super.initState();
  }

  getPositions() async {
    var res =
        await http.get(Uri.parse("http://192.168.2.2/bright/api/position"));
    if (res.statusCode == 200) {
      var object = jsonDecode(res.body);
      return object;
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _positionController = TextEditingController();
  final apiUrl = getMyUrl();

  Future<void> savePostion() async {
    print("1");
    var savePosition = await http.post(
      Uri.parse("http://192.168.2.2/bright/api/position/savePosition"),
      body: {"position": _positionController.text},
    );
    print("savePosition");
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
                    var result = savePostion();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminHumanDesignationScreen(),
                    ));
                    // Navigator.of(context).pop();
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
          future: getPositions(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      elevation: 5,
                      // color: Colors.white54,
                      shadowColor: Colors.blue,
                      child: ListTile(
                        leading: Expanded(
                            child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        )),
                        title: Text(
                          snapshot.data[index]['position'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        trailing: Icon(
                          Icons.delete,
                          color: Colors.blue,
                          size: 25.0,
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
