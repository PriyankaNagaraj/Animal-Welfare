import 'package:animal_welfare/routes/routes.dart';
import 'package:animal_welfare/screens/certificate_tab_screen.dart';
import 'package:animal_welfare/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

final storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF2E2E2E),
        accentColor: Color(0xFF2E2E2E),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: routes,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(future: storage.read(key: 'AccessToken'), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        if(snapshot.data == null) {
          return LoginScreen();
        } else {
          return CertificateTabScreen();
        }
      } else {
        return Container();
      }
    });
  }
}
