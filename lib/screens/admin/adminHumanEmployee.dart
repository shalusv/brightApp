import 'package:flutter/material.dart';

class AdminHumanEmployee extends StatefulWidget {
  const AdminHumanEmployee();

  @override
  _AdminHumanEmployeeState createState() => _AdminHumanEmployeeState();
}

class _AdminHumanEmployeeState extends State<AdminHumanEmployee> {
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
      body: Column(),
    );
  }
}
