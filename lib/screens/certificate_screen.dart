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
  bool isInfected;
  bool fitForTravel;
  bool isMixed;
  bool isClassMixed;
  bool isDiseasedMixed;
  bool givenTranq;
  String purpose;
  List<Purpose> purposeList = [
    Purpose(purpose: "Fit for Breeding purpose", isSelected: false),
    Purpose(purpose: "Fit for Draught purpose", isSelected: false),
    Purpose(purpose: "Fit for Milking purpose", isSelected: false)
  ];

  List<String> purposes = [
    "Farming/Draught",
    "Milking/Breeding",
    "Slaughter",
    "Other"
  ];
  List<String> animalDetails = ["animalDetails"];

  @override
  Widget build(BuildContext context) {
    var sSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF3F7FF),
            appBar: AppBar(
              title: Text(widget.chosenAnimal),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(children: <Widget>[
                Text(
                  "Proforma for applying or permission or issue of cert. before transportation of Animals",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Consignor Details",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Phone Number"),
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Consignee Details",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Phone Number"),
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Transport Auth Details",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Phone Number"),
                      ),
                    ),
                  ],
                )),
                Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Driver Details",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("Phone Number"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: textFieldDecoration("License Number"),
                      ),
                    ),
                  ],
                )),
                Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text("Certify the below details",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "The animals are free from infectious diseases and are fit to undertake the journey",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: isInfected,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isInfected = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: isInfected,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isInfected = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Visibility(
                                  visible: (isInfected != null && !isInfected),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Reason"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "There are no animals which are unfit for transport such as newborn, diseased, blind, emaciated lame, fatigue or having given birth the preceeding 72 hours or likely to give birth during the transport",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: fitForTravel,
                                      onChanged: (bool value) {
                                        setState(() {
                                          fitForTravel = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: fitForTravel,
                                      onChanged: (bool value) {
                                        setState(() {
                                          fitForTravel = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Visibility(
                                  visible:
                                      (fitForTravel != null && !fitForTravel),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Reason"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Pregnant and young animals are not mixed with their mother during transport",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: isMixed,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isMixed = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: isMixed,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isMixed = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Visibility(
                                  visible: (isMixed != null && !isMixed),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Reason"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Different classes of animals are kept separately during transport",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: isClassMixed,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isClassMixed = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: isClassMixed,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isClassMixed = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Visibility(
                                  visible:
                                      (isClassMixed != null && !isClassMixed),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Reason"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Diseased animals are not mixed with other animals",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: isDiseasedMixed,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isDiseasedMixed = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: isDiseasedMixed,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isDiseasedMixed = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Visibility(
                                  visible: (isDiseasedMixed != null &&
                                      !isDiseasedMixed),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Reason"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Troublesome animals are given tranquillisers for loading",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: givenTranq,
                                      onChanged: (bool value) {
                                        setState(() {
                                          givenTranq = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: givenTranq,
                                      onChanged: (bool value) {
                                        setState(() {
                                          givenTranq = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Visibility(
                                  visible: (givenTranq != null && !givenTranq),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Reason"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: sSize.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Purpose before they are transported",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      value: purpose,
                                      hint: Text("Choose One"),
                                      items: purposes.map((purpose) {
                                        return DropdownMenuItem<String>(
                                          value: purpose,
                                          child: Text(purpose),
                                        );
                                      }).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          purpose = val;
                                        });
                                      }),
                                ),
                                Visibility(
                                  visible:
                                      (purpose != null && purpose == "Other"),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 16),
                                      decoration: textFieldDecoration(
                                          "Specify other purpose"),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Whether animals have required provision of feed - fodder, water, rest and milking facilities during transportation",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: givenTranq,
                                      onChanged: (bool value) {
                                        setState(() {
                                          givenTranq = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: givenTranq,
                                      onChanged: (bool value) {
                                        setState(() {
                                          givenTranq = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    style: TextStyle(fontSize: 14),
                                    decoration:
                                        textFieldDecoration("Mention Feed"),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Whether animals have required provision of feed - fodder, water, rest and milking facilities during transportation",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("Yes"),
                                      value: true,
                                      groupValue: givenTranq,
                                      onChanged: (bool value) {
                                        setState(() {
                                          givenTranq = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text("No"),
                                      value: false,
                                      groupValue: givenTranq,
                                      onChanged: (bool value) {
                                        setState(() {
                                          givenTranq = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    style: TextStyle(fontSize: 14),
                                    decoration:
                                        textFieldDecoration("Mention Feed"),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Text("Transportation Details",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration: textFieldDecoration("Time"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration: textFieldDecoration("Place"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration:
                                      textFieldDecoration("Mode of Transport"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration:
                                      textFieldDecoration("Departure Time"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration:
                                      textFieldDecoration("Arrival Time"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(
                                    "Place of inspection by the authorised epresentative of Animal Welfare Board of India (AWBI)",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: TextStyle(fontSize: 14),
                                    decoration: textFieldDecoration("Place"),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
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
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xFF4D4D4E).withOpacity(0.5)));
  }
}
