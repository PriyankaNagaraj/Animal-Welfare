import 'dart:convert';
import 'dart:io';
import 'package:animal_welfare/model/fetched_cert_model.dart';
import 'package:http/http.dart' as http;
import 'package:animal_welfare/main.dart';
import 'package:animal_welfare/model/certificate_model.dart';

final Auth authentication = Auth();

class Auth {
  String baseURL =
      "http://164.52.197.63:9988/rest"; //"https://ccqa.lawshram.com/rest";

  Map<String, String> header = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future sendOTP(String userID) async {
    String url = '$baseURL/no-auth/otp/$userID';
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
    var loginData = json.encode({"governmentId": userID, "otp": otp});
    var resBody;
    try {
      resBody = await http.post(Uri.encodeFull(url),
          body: loginData, headers: header);
      await storage.write(key: 'doctorId', value: userID);
      print(resBody);
    } on SocketException {
      throw ("No Internet Connection");
    } on FormatException {
      throw ("Unable to reach the server");
    }
    return resBody;
  }

  Future fetchCertificates(int from, int to) async {
    String url = '$baseURL/certificates';
    String token = await storage.read(key: 'AccessToken');
    String doctorId = await storage.read(key: 'doctorId');

    var requestData = json.encode({
      "doctorId": doctorId,
      "offsetHour": 5,
      "offsetMinute": 30,
      "from": (from == null) ? "" : from.toString(),
      "to": (to == null) ? "" : to.toString()
    });

    var headerData = header;
    headerData.addAll({"Authorization": token});
    var resBody;
    try {
      var res = await http.post(Uri.encodeFull(url),
          body: requestData, headers: header);
      resBody = json.decode(res.body);
    } on SocketException {
      throw ("No Internet Connection");
    } on FormatException {
      throw ("Unable to reach the server");
    }

    if (resBody["status"] == 200) {
      List certificateList = resBody["entity"];
      return certificateList
          .map((f) => FetchedCertificate.fromJson(f))
          .toList();
    } else
      Future.error(resBody["message"]);
  }

  Future createCertificate(Certificate certificateData) async {
    String url = '$baseURL/certificate';
    String token = await storage.read(key: 'AccessToken');
    var requestData = json.encode(certificateData);
    var headerData = header;
    headerData.addAll({"Authorization": token});
    var resBody;
    try {
      var res = await http.post(Uri.encodeFull(url),
          body: requestData, headers: header);
      resBody = json.decode(res.body);
    } on SocketException {
      throw ("No Internet Connection");
    } on FormatException {
      throw ("Unable to reach the server");
    }
    return resBody;
  }
}
