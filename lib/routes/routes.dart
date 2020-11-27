import 'package:animal_welfare/screens/certificate_tab_screen.dart';
import 'package:animal_welfare/screens/login_screen.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  CertificateTabScreen.routeName: (BuildContext context) =>
      CertificateTabScreen(),
};
