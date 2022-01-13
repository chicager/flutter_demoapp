import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  bool _hidePass = true;
  bool _confirmPass = true;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                hintText: 'Type your full name',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
              validator: (String? val) =>
                  val!.isEmpty ? 'Name is required' : null,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                hintText: 'Type your phone number',
                helperText: 'Phone format: (XXX)XXX-XXXX',
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email address',
                hintText: 'Type your email address',
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Life Story',
                hintText: 'Type about yourself',
                helperText: 'Keep it short, it\'s just a demo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Type your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                ),
                icon: Icon(Icons.security),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _confirmPass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _confirmPass = !_confirmPass;
                    });
                  },
                  icon: Icon(
                      _confirmPass ? Icons.visibility : Icons.visibility_off),
                ),
                icon: Icon(Icons.border_color),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[600], // background
                  onPrimary: Colors.white, // foreground
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: _submitForm,
                child: Text(
                  'Submit Form',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Form is valid');
      print('Name: ${_nameController.text}');
      print('Name: ${_phoneController.text}');
      print('Name: ${_emailController.text}');
      print('Name: ${_storyController.text}');
    }
  }
}
