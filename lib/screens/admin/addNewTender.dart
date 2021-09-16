import 'package:bright_ui/datas/datas.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class AddNewTender extends StatefulWidget {
  @override
  _AddNewTenderState createState() => _AddNewTenderState();
}

String _currentSelectedItem = 'Open';

class _AddNewTenderState extends State<AddNewTender> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _ConfirmPasswordController = TextEditingController();
  final _nameControler = TextEditingController();
  String selectedType = '';
  final String selectedStatus = '';
  final tenderTypeController = TextEditingController();
  final tenderStatus = TextEditingController();

  Widget _buildTextField(
      String labelText, String hintText, TextInputType keyboardType) {
    return TextFormField(
      // controller: _nameControler,
      keyboardType: keyboardType,
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: inputFieldBorderRadius,
          borderSide: BorderSide(
            width: 10,
            color: Colors.amber,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        // fillColor: inputFieldColorFilled,
        filled: true,
      ),
    );
  }

  List<String> tenderTypes = ['Open Tendering', 'Selective', 'Negotiated'];
  List<String> tenderStatuses = ['In Process', 'Approved', 'Rejected'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Tender'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            // color: Colors.greenAccent,
            ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Text(
                        "Status",
                        style: TextStyle(color: Colors.blue[600]),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 180,
                        padding: EdgeInsets.only(left: 5),
                        child: DropdownButtonFormField<int>(
                          onChanged: (value) {},
                          decoration: InputDecoration.collapsed(hintText: ''),
                          // decoration: InputDecoration(
                          //     border: UnderlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.white))),
                          value: 3,
                          items: <DropdownMenuItem<int>>[
                            DropdownMenuItem<int>(
                              value: 2,
                              child: Text("Approved"),
                            ),
                            DropdownMenuItem<int>(
                              value: 3,
                              child: Text("Rejected"),
                            ),
                            DropdownMenuItem<int>(
                              value: 1,
                              child: Text("In Process"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: _buildTextField(
                              'ID', 'Enter Tender ID', nameType),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: _buildTextField(
                              'Reference No', 'Reference No', numberType),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildTextField(
                      'Tender Title', 'Enter Tender ID', nameType),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildTextField(
                      'Work Description', 'Work Description', nameType),
                ),
                SizedBox(height: 25),
                Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tender Type'),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              items: <String>[
                                'Open',
                                'Selective',
                                'Negotiated',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                );
                              }).toList(),
                              value: _currentSelectedItem,
                              onChanged: (value) {
                                setState(() {
                                  _currentSelectedItem = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: _buildTextField(
                                'Published Date', 'Published Date', dateType)),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: _buildTextField('Bid Opening Date',
                                'Bid Opening Date', dateType)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: _buildTextField('Submission Start Date',
                                'Start Date', dateType)),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: _buildTextField(
                                'Submission End Date', 'End Date', dateType)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: _buildTextField(
                              'Tender Value', 'Value', numberType),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: _buildTextField('EMD', 'EMD', numberType),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child:
                              _buildTextField('Enter BOQ ', 'BOQ', numberType),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Upload',
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    Icon(
                                      Icons.upload,
                                      color: Colors.grey[900],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        if (!_formKey.currentState.validate()) {},
                        _formKey.currentState.save(),
                      },
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          color: submitButtonTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
