import 'package:animal_welfare/screens/animal_details.dart';
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

class CheckList {
  String check;
  bool isSelected;
  CheckList({@required this.check, @required this.isSelected});
}

class CertificateScreenState extends State<CertificateScreen> {
  final outLineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x1A000000)),
      borderRadius: BorderRadius.circular(5));
  final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2E2E2E)),
      borderRadius: BorderRadius.circular(5));

  bool isInfected;
  bool fitForTravel;
  bool isMixed;
  bool isClassMixed;
  bool isDiseasedMixed;
  bool givenTranq;
  String purpose;
  bool firstCertificate = false;
  List<CheckList> secondCertificateCheckList = [
    CheckList(
        check:
            "I hereby certify that I have read rules 46 to 56 in Chapter IV of the Transport of Animals Rules, 1978.",
        isSelected: false),
    CheckList(
        check:
            "That, at the request of consignor I have examined the above mentioned Cattle in the goods vehicle/railway wagons not more than 12 hours before their departure.",
        isSelected: false),
    CheckList(
        check:
            "That, each cattle appeared to be in a fit condition to travel by rail/road and is not showing any signs of infectious contagious or parasitic disease and that it has been vaccinated against rinderpest and any other infectious or contagious or parasitic disease(s).",
        isSelected: false),
    CheckList(
        check:
            "That the cattle were adequately fed and watered for the purpose of the journey.",
        isSelected: false),
    CheckList(check: "That the cattle have been vaccinated.", isSelected: false)
  ];
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
                                  decoration: textFieldDecoration(
                                      "Place of inspection"),
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
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    "I hereby certify that I have read the Rules 96 of the Transport of Animals (amendment) Rules 2001 and the Permission for transport of animals as per the above application is hereby issued.",
                    style: TextStyle(fontSize: 10),
                  ),
                  value: firstCertificate,
                  onChanged: (bool newValue) {
                    setState(() {
                      firstCertificate = newValue;
                    });
                  },
                ),
                Card(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child:
                          Text("SCHEDULE - H", style: TextStyle(fontSize: 14)),
                    ),
                    Text("(See Rule 47)", style: TextStyle(fontSize: 10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Proforma for Certificate of fitness to travel Cattle",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration(
                            "Date and Time of the examination"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Cattle Species"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration(
                            "Name of the truck/Railway Wagon"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Number of Cattle"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Sex"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Age"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Transport From"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Transport To"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: textFieldDecoration("Via"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration:
                            textFieldDecoration("Duration of the Journey"),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        ...secondCertificateCheckList.map(
                          (e) => CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              e.check ?? "",
                              style: TextStyle(fontSize: 10),
                            ),
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
                                  "Vaccination Details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration: textFieldDecoration("Type"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  decoration: textFieldDecoration("Date"),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                )),
                RaisedButton(
                  color: Color(0xFF2E2E2E),
                  child: Text(
                    "Proceed to fill the animal details",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AnimalDetails(chosenAnimal: widget.chosenAnimal)));
                  },
                ),
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
