import 'package:bright_ui/datas/formFields.dart';
import 'package:bright_ui/datas/validation.dart';
import 'package:bright_ui/global.dart';
import 'package:bright_ui/models/humanRespurces/employee.dart';
import 'package:bright_ui/models/humanRespurces/role.dart';
import 'package:bright_ui/screens/admin/adminUsers.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:bright_ui/models/humanRespurces/positon.dart';
import 'package:bright_ui/screens/admin/adminHumanEmployee.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser(Function refresh);

  @override
  _AddNewUserState createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  var role = new Role();
  var employees = new Employee();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _employeeId;
  final _userNameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  // final _roleIdCtrl = TextEditingController();
  var _roleId;

  Future<void> saveUser() async {
    Map mapedData = {
      'userName': _userNameCtrl.text,
      'password': _passwordCtrl.text,
      'roleId': _roleId.toString(),
      'employeeId': _employeeId.toString(),
    };
    var response = await http.post(
      Uri.parse("${apiServer}user/saveUser"),
      body: mapedData,
    );
    print(mapedData);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("object");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminUsers(),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New User'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                // SearchableDropdown.single(
                //   items: [
                //     DropdownMenuItem(
                //       child: Text("Sachitnandan"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Aromal"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Devangnan"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Markus"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Sachitnandan"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Aromal"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Devangnan"),
                //       value: 1,
                //     ),
                //     DropdownMenuItem(
                //       child: Text("Markus"),
                //       value: 1,
                //     ),
                //   ],
                //   value: _employeeId,
                //   hint: "Select Employee",
                //   searchHint: "Select Employee",
                //   isCaseSensitiveSearch: true,
                //   onChanged: (value) {
                //     setState(() {
                //       _employeeId = value;
                //     });
                //   },
                //   dialogBox: true,
                //   isExpanded: true,
                // ),
                buildEmployees(),
                SizedBox(
                  height: 15.0,
                ),
                buildRoles(),

                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: _userNameCtrl,
                  // validator: validateEmail,
                  decoration: buildInputDecoration(
                      "Enter a User Name", Icons.person, "User Name"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: _passwordCtrl,
                  validator: (val) {
                    if (val.isEmpty) return 'Empty';
                    return null;
                  },
                  decoration: buildInputDecoration(
                      "Enter Password", Icons.email, "Password"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: _confirmCtrl,
                  validator: (val) {
                    if (val.isEmpty) return 'Empty';
                    if (val != _passwordCtrl.text) return 'Not Match';
                    return null;
                  },
                  decoration: buildInputDecoration(
                      "Confirm Password", Icons.email, "Confirm Password"),
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print("pressed add");
                      if (_formKey.currentState.validate()) {
                        print("validated");
                        saveUser();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('There is some mistakes')),
                        );
                      }
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildRoles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: FutureBuilder<List<Role>>(
            future: role.fetchRoles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Select a Role'),
                  isExpanded: true,
                  value: _roleId,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  onChanged: (newValue) {
                    setState(() {
                      _roleId = newValue;
                    });
                  },
                  items: snapshot.data.map<DropdownMenuItem>((Role value) {
                    return DropdownMenuItem(
                      value: value.roleId,
                      child: Text(value.role),
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  buildEmployees() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: FutureBuilder<List<Employee>>(
            future: employees.fetchAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Select an Employee'),
                  isExpanded: true,
                  value: _employeeId,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  onChanged: (newValue) {
                    setState(() {
                      _employeeId = newValue;
                    });
                  },
                  items: snapshot.data.map<DropdownMenuItem>((Employee value) {
                    return DropdownMenuItem(
                      value: value.employeeId,
                      child: Text(value.name),
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  buiilddropdown() {
    //   return DropDownFormField(
    //     titleText: 'Work',
    //     hintText: 'Please choose one',
    //     value: _positionId,
    //     onSaved: (value) {
    //       setState(() {
    //         _positionId = value;
    //       });
    //     },
    //     onChanged: (value) {
    //       setState(() {
    //         _positionId = value;
    //       });
    //     },
    //     // dataSource: position.fetchPosition(),
    //     textField: 'display',
    //     valueField: 'value',
    //   );
  }
}
