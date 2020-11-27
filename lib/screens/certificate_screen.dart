import 'package:animal_welfare/common/dialogs.dart';
import 'package:flutter/material.dart';

class CertificateScreen extends StatefulWidget {
  static const String routeName = '/CertificateScreen';
  final String chosenAnimal;
  CertificateScreen({@required this.chosenAnimal});

  @override
  CertificateScreenState createState() {
    return CertificateScreenState();
  }
}

class Purpose {
  String purpose;
  bool isSelected;
  Purpose({@required this.purpose, @required this.isSelected});
}

class CertificateScreenState extends State<CertificateScreen> {
  final outLineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x1A000000)),
      borderRadius: BorderRadius.circular(5));
  final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2E2E2E)),
      borderRadius: BorderRadius.circular(5));

  int gender;
  String purpose;
  List<Purpose> purposeList = [
    Purpose(purpose: "Fit for Breeding purpose", isSelected: false),
    Purpose(purpose: "Fit for Draught purpose", isSelected: false),
    Purpose(purpose: "Fit for Milking purpose", isSelected: false)
  ];

  List<String> animalDetails = ["animalDetails"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.chosenAnimal),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Animal Details",
                          style: TextStyle(fontSize: 16)),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            animalDetails.add("value");
                          });
                        })
                  ],
                ),
                Column(
                  children: <Widget>[
                    ...animalDetails.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  style: TextStyle(fontSize: 16),
                                  decoration: textFieldDecoration("Species"),
                                ),
                                SizedBox(height: 4),
                                TextField(
                                  style: TextStyle(fontSize: 16),
                                  decoration: textFieldDecoration("Breed"),
                                ),
                                SizedBox(height: 4),
                                TextField(
                                  style: TextStyle(fontSize: 16),
                                  decoration: textFieldDecoration("Age"),
                                ),
                                SizedBox(height: 4),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Male"),
                                      value: 0,
                                      groupValue: gender,
                                      onChanged: (int value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Female"),
                                      value: 1,
                                      groupValue: gender,
                                      onChanged: (int value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ),
                                  )
                                ]),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 16),
                                  decoration:
                                      textFieldDecoration("Number of animals"),
                                ),
                                SizedBox(height: 4),
                                TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: TextStyle(fontSize: 16),
                                  decoration:
                                      textFieldDecoration("Description"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Please check wherever applicable",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    ...purposeList.map(
                                      (e) => CheckboxListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        title: Text(e.purpose ?? ""),
                                        value: e.isSelected,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            e.isSelected = newValue;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Purpose of Transportation",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                RadioListTile(
                  title: Text("For Farming/Draught purpose"),
                  value: "For Farming/Draught purpose",
                  groupValue: purpose,
                  onChanged: (String value) {
                    setState(() {
                      purpose = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("For Milking/Breeding purpose"),
                  value: "For Milking/Breeding purpose",
                  groupValue: purpose,
                  onChanged: (String value) {
                    setState(() {
                      purpose = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("For Slaughter purpose"),
                  value: "For Slaughter purpose",
                  groupValue: purpose,
                  onChanged: (String value) {
                    setState(() {
                      purpose = value;
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 16),
                  decoration: textFieldDecoration("Any other reason"),
                ),
                SizedBox(height: 4),
                TextField(
                  style: TextStyle(fontSize: 16),
                  decoration:
                      textFieldDecoration("Registration Number of Vehicle"),
                ),
                SizedBox(height: 4),
                TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: textFieldDecoration("Transported From"),
                ),
                SizedBox(height: 4),
                TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: textFieldDecoration("Transporting To"),
                ),
                SizedBox(height: 4),
                TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: textFieldDecoration("VIA"),
                ),
                SizedBox(height: 4),
                TextField(
                  style: TextStyle(fontSize: 16),
                  decoration:
                      textFieldDecoration("Duration of Proposed journey"),
                ),
                Card(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Transport Authority/Agency",
                          style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name and Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Contact Number"),
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Vehicle's Driver",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(fontSize: 16),
                      decoration: textFieldDecoration("Name and Address"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      decoration: textFieldDecoration("Driving License Number"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16),
                      decoration: textFieldDecoration("Contact Number"),
                    ),
                  ),
                ])),
                Card(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Consignor", style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name and Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Contact Number"),
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Consignee", style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name and Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Contact Number"),
                      ),
                    ),
                  ],
                )),
                RaisedButton(
                  color: Color(0xFF2E2E2E),
                  child: Text(
                    'Issue Ticket',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  onPressed: () async => {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => WillPopScope(
                              onWillPop: () async => false,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )),
                    await Future.delayed(Duration(seconds: 2)),
                    Navigator.of(context).pop(),
                    showDialog(
                        context: context,
                        builder: (context) => CommonAlertDialog(
                              title: Text("Ticket issued successfully!"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                        color: Color(0xFF007AFF),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)..pop()..pop();
                                  },
                                ),
                              ],
                            ))
                  },
                )
              ]),
            )));
  }

  textFieldDecoration(String labelText) {
    return InputDecoration(
        errorBorder: outLineBorder,
        focusedErrorBorder: focusedBorder,
        enabledBorder: outLineBorder,
        focusedBorder: focusedBorder,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xFF4D4D4E).withOpacity(0.5)));
  }
}
