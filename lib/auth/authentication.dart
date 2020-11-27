import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:animal_welfare/main.dart';


final Auth authentication = Auth();

class Auth {
  String baseURL = "https://ccqa.lawshram.com/rest";
  Map<String, String> header = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future sendOTP(String userID) async {
    String url = '$baseURL/noauth/otp/$userID';
    var resBody;
    try {
      var res = await http.post(Uri.encodeFull(url), headers: header);
      resBody = json.decode(res.body);

      print(resBody);
    } on SocketException {
      throw ("No Internet Connection");
    } on FormatException {
      throw ("Unable to reach the server");
    }
    return resBody;
  }

  Future login(String userID, String otp) async {
    String url = '$baseURL/login';
    var loginData = json.encode({"emailId": userID, "otp": otp});
    var resBody;
    try {
       resBody = await http.post(Uri.encodeFull(url),
          body: loginData, headers: header);
      print(resBody);
    } on SocketException {
      throw ("No Internet Connection");
    } on FormatException {
      throw ("Unable to reach the server");
    }
    return resBody;
  }
}
