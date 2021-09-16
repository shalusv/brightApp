import 'package:bright_ui/datas/datas.dart';
import 'package:flutter/material.dart';

class AddNewMaterial extends StatefulWidget {
  @override
  _AddNewMaterialState createState() => _AddNewMaterialState();
}

class _AddNewMaterialState extends State<AddNewMaterial> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _ConfirmPasswordController = TextEditingController();
  final _nameControler = TextEditingController();

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameControler,
      keyboardType: emailType,
      obscureText: false,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Provide a Name';
        } else if (value.length < 15 || value.length < 3) {
          return 'name must be between 3 and 15';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: inputFieldBorderRadius,
          borderSide: BorderSide(
            width: 10,
            color: inputFieldColor,
          ),
        ),
        labelText: 'Name',
        hintText: 'Enter NAme',
        // fillColor: inputFieldColorFilled,
        filled: true,
      ),
    );
  }

  Widget _buildEmailField() {
    return null;
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      keyboardType: nameType,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Provide a Password';
        } else if (value.length < 15 || value.length < 3) {
          return 'Password must be between 3 and 15';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: inputFieldBorderRadius,
          borderSide: BorderSide(
            color: inputFieldColor,
          ),
        ),
        labelText: 'Password',
        // fillColor: inputFieldColorFilled,
        filled: true,
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _ConfirmPasswordController,
      obscureText: true,
      keyboardType: nameType,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Provide a Confirm Password';
        } else if (value.length < 15 || value.length < 3) {
          return 'Password must be between 3 and 15';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: inputFieldBorderRadius,
          borderSide: BorderSide(
            color: inputFieldColor,
          ),
        ),
        labelText: 'Password',
        // fillColor: inputFieldColorFilled,
        filled: true,
      ),
    );
  }

  Widget _buildNUmberField() {
    return null;
  }

  Widget _buildUrlField() {
    return null;
  }

  Widget _buildCaloriesField() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Tender'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildNameField(),
                ),
                // _buildEmailField(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildPasswordField(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildConfirmPasswordField(),
                ),
                // _buildNUmberField(),
                // _buildUrlField(),
                // _buildCaloriesField(),

                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: () => {
                //     if (!_formKey.currentState.validate()) {},
                //     _formKey.currentState.save(),
                //     print(name),
                //   },
                //   child: Text(
                //     'Submit',
                //     style: TextStyle(
                //       color: submitButtonTextColor,
                //     ),
                //   ),
                // ),
                FloatingActionButton(
                  onPressed: () {
                    _formKey.currentState.validate();
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
