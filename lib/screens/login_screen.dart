import 'dart:convert';

import 'package:animal_welfare/auth/authentication.dart';
import 'package:animal_welfare/common/dialogs.dart';
import 'package:animal_welfare/screens/certificate_tab_screen.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _userController;
  TextEditingController _otpController;
  bool _userValidate = false;
  bool _otpValidate = false;
  bool resend = false;
  final titleStyle = TextStyle(fontSize: 14);
  final outLineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x1A000000)),
      borderRadius: BorderRadius.circular(5));
  final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2E2E2E)),
      borderRadius: BorderRadius.circular(5));

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var sSize = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Color(0xFFF3F7FF),
        appBar: AppBar(
          title: Text("Animal Welfare"),
        ),
        bottomNavigationBar: Container(
          width: sSize.width * 0.9,
          margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 16),
          child: RaisedButton(
              color: Color(0xFF2E2E2E),
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              onPressed: () {
                setState(() {
                  _userController.text.isEmpty
                      ? _userValidate = true
                      : _userValidate = false;
                  _otpController.text.isEmpty
                      ? _otpValidate = true
                      : _otpValidate = false;
                });
                if (!_userValidate && !_otpValidate) {
                  FocusScope.of(context).unfocus();
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => WillPopScope(
                            onWillPop: () async => false,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ));
                  authentication
                      .login(_userController.text.trim(), _otpController.text)
                      .then((onValue) async {
                    var resBody = json.decode(onValue.body);
                    Navigator.of(context).pop();
                    if (onValue.statusCode == 200) {
                      await storage.write(
                          key: 'AccessToken', value: resBody["access_token"]);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CertificateTabScreen()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            ErrorDialog(title: resBody["message"]),
                      );
                    }
                  });
                }
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text("Login",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: TextField(
                  controller: _userController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      errorBorder: outLineBorder,
                      focusedErrorBorder: focusedBorder,
                      enabledBorder: outLineBorder,
                      focusedBorder: focusedBorder,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                      labelText: 'User ID',
                      labelStyle:
                          TextStyle(color: Color(0xFF4D4D4E).withOpacity(0.5)),
                      errorText:
                          _userValidate ? "User ID cannot be empty" : ""),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, vertical: 15.0),
                child: Container(
                  width: 30,
                  child: FlatButton(
                      color: Color(0xFF2E2E2E),
                      shape: StadiumBorder(),
                      child: Text(
                        resend == true ? "Resend OTP" : "Send OTP",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          _userController.text.isEmpty
                              ? _userValidate = true
                              : _userValidate = false;
                        });
                        if (_userValidate == false) {
                          FocusScope.of(context).unfocus();
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => WillPopScope(
                                    onWillPop: () async => false,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ));
                          authentication
                              .sendOTP(_userController.text.trim())
                              .then((onValue) async {
                            Navigator.of(context).pop();
                            if (onValue['status'] == 200) {
                              setState(() {
                                resend = true;
                              });
                              showDialog(
                                context: context,
                                builder: (context) => ErrorDialog(
                                    title:
                                        "OTP is sent to your registered email address"),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    ErrorDialog(title: onValue["message"]),
                              );
                            }
                          });
                        }
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  obscureText: true,
                  controller: _otpController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    errorBorder: outLineBorder,
                    focusedErrorBorder: focusedBorder,
                    enabledBorder: outLineBorder,
                    focusedBorder: focusedBorder,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                    labelText: 'OTP',
                    labelStyle:
                        TextStyle(color: Color(0xFF4D4D4E).withOpacity(0.5)),
                    errorText: _otpValidate ? "OTP cannot be empty" : "",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "OTP is sent to the email address registered with the board",
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
