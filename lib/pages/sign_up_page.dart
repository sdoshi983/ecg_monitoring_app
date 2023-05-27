import 'package:ecg_monitor/helpers/constant.dart';
import 'package:ecg_monitor/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name = TextEditingController(text: '');
  TextEditingController phone = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController cpassword = TextEditingController(text: '');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100,),
                Center(
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Name',
                    floatingLabelStyle: TextStyle(color: deepPurple),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: deepPurple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Phone',
                    floatingLabelStyle: TextStyle(color: deepPurple),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: deepPurple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    floatingLabelStyle: TextStyle(color: deepPurple),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: deepPurple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    floatingLabelStyle: TextStyle(color: deepPurple),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: deepPurple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field is required';
                    }
                    return null;
                  },
                  controller: cpassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Confirm Password',
                    floatingLabelStyle: TextStyle(color: deepPurple),
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: deepPurple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform login action here
                    onSignUpButtonClicked();
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF3048),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSignUpButtonClicked() async {
    if(_formKey.currentState.validate()){
      if(cpassword.text != password.text){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password and Confirm Password does not match')));
        return;
      }
      showDialogMethod(context, const Center(child: CircularProgressIndicator(),));

      bool userExists = false;
      var usersList = await users.get();
      for(var user in usersList.docs){
        if(user['email'] == email.text){
          userExists = true;
          break;
        }
      }

      if(userExists){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This email id is already in use!')));
        Navigator.of(context).pop();
        return;
      }

      await users.add({
        'name': name.text,
        'phone': phone.text,
        'email': email.text,
        'password': password.text,
      });
      await Constants.prefs.setBool('isLoggedIn', true);
      await Constants.prefs.setString('emailId', email.text);
      Navigator.of(context).pop();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Dashboard()), (route) => false);
    }
  }

  showDialogMethod(
      BuildContext context, Widget widget) async {
    var result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
    return result;
  }
}
