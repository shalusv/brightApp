import 'package:bright_ui/datas/formFields.dart';
import 'package:bright_ui/datas/validation.dart';
import 'package:bright_ui/global.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:bright_ui/models/humanRespurces/positon.dart';
import 'package:bright_ui/screens/admin/adminHumanEmployee.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewEmployee extends StatefulWidget {
  const AddNewEmployee(Function refresh);

  @override
  _AddNewEmployeeState createState() => _AddNewEmployeeState();
}

class _AddNewEmployeeState extends State<AddNewEmployee> {
  var position = new Position();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _dobController = TextEditingController();
  int _positionId;
  int _gender;
  DateTime _dob;

  Future<void> saveEmployee() async {
    print("123==");
    Map mapedData = {
      'name': _nameCtrl.text,
      'email': _emailCtrl.text,
      'positionId': _positionId.toString(),
      'gender': _gender.toString(),
      'dob': _dob.toString(),
    };
    // print(mapedData);
    var response = await http.post(
      Uri.parse("${apiServer}employee/saveEmployee"),
      body: mapedData,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdminHumanEmployee(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Employee'),
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
                TextFormField(
                  autofocus: false,
                  controller: _nameCtrl,
                  // validator: validateEmail,
                  decoration: buildInputDecoration(
                      "Enter a Name", Icons.person, "Name"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  controller: _emailCtrl,
                  validator: validateEmail,
                  decoration:
                      buildInputDecoration("Enter email", Icons.email, "Email"),
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildPosition(),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
                genderBuild(),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Select Date of Birth",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                buildDobPicker(),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        saveEmployee();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('There is osme misstakes')),
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

  buildDobPicker() {
    return TextFormField(
      readOnly: true,
      controller: _dobController,
      // validator: dateValidator,
      decoration: InputDecoration(
        hintText: "Select Date of Birth",
        border: OutlineInputBorder(),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        errorStyle: TextStyle(color: Colors.amber),
        suffixIcon: GestureDetector(
          child: Icon(
            Icons.date_range,
            color: Colors.blue[300],
          ),
          onTap: () async {
            DateTime date = DateTime(1900);
            FocusScope.of(context).requestFocus(new FocusNode());

            date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1960),
                lastDate: DateTime(2025));
            if (date == null) {
              _dobController.text = "";
            } else {
              _dob = date;
              _dobController.text = DateFormat('dd-MM-yyyy').format(date);
            }
          },
        ),
      ),
    );
  }

  Widget genderBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                      print(_gender);
                    });
                  },
                ),
                Text(
                  'Male',
                  style: new TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                      print(_gender);
                    });
                  },
                ),
                Text(
                  'Female',
                  style: new TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                      print(_gender);
                    });
                  },
                ),
                Text(
                  'Other',
                  style: new TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  buildPosition() {
    print(_positionId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: FutureBuilder<List<Position>>(
            future: position.fetchPositions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data);
                // print("==${_positionId}==");
                return DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Select Position'),
                  isExpanded: true,
                  value: _positionId,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  onChanged: (newValue) {
                    setState(() {
                      print(_positionId);
                      _positionId = newValue;
                      print(_positionId);
                    });
                  },
                  items: snapshot.data.map<DropdownMenuItem>((Position value) {
                    return DropdownMenuItem(
                      value: value.positionId,
                      // child: Text(value.position),
                      child: Text(
                          "${value.position[0].toUpperCase()}${value.position.substring(1)}"),
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
