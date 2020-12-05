import 'package:animal_welfare/model/certificate_model.dart';
import 'package:animal_welfare/screens/animal_details.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final GlobalKey<FormState> _certificateKey = GlobalKey<FormState>();

  final outLineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x1A000000)),
      borderRadius: BorderRadius.circular(5));
  final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2E2E2E)),
      borderRadius: BorderRadius.circular(5));

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

  List<String> purposes = [
    "Farming/Draught",
    "Milking/Breeding",
    "Slaughter",
    "Other"
  ];
  Certificate certificateModel;
  bool valid;
  bool autoValidate = false;
  @override
  void initState() {
    super.initState();
    certificateModel = Certificate();
  }

  @override
  Widget build(BuildContext context) {
    print("Model is $certificateModel");
    var sSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF3F7FF),
            appBar: AppBar(
              title: Text(widget.chosenAnimal),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _certificateKey,
                autovalidate: autoValidate,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: <Widget>[
                    Text(
                      "Proforma for applying or permission or issue of cert. before transportation of Animals",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Name"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.consignorDetails.name = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.consignorDetails.address = val;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Address"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Phone Number"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.consignorDetails.contactNumber =
                                  val;
                            },
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
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Name"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.consigneeDetails.name = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Address"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.consigneeDetails.address = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Phone Number"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.consigneeDetails.contactNumber =
                                  val;
                            },
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
                          child: Text("Transport Agency Details",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Name"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.transportAgencyDetails.name =
                                  val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Address"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.transportAgencyDetails.address =
                                  val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Phone Number"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel
                                  .transportAgencyDetails.contactNumber = val;
                            },
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
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Name"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.driverDetails.name = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Address"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.driverDetails.address = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("Phone Number"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.driverDetails.contactNumber =
                                  val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration("License Number"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.driverLicenceNumber = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 16),
                            decoration: textFieldDecoration(
                                "Vehicle Registration Number"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.vehicleRegistrationNumber = val;
                            },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .areAnimalsFreeFromDiseases
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .areAnimalsFreeFromDiseases
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .areAnimalsFreeFromDiseases
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .areAnimalsFreeFromDiseases
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Visibility(
                                      visible: (certificateModel
                                                  .areAnimalsFreeFromDiseases
                                                  .isTrue !=
                                              null &&
                                          !certificateModel
                                              .areAnimalsFreeFromDiseases
                                              .isTrue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 14),
                                          decoration:
                                              textFieldDecoration("Reason"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel
                                                .areAnimalsFreeFromDiseases
                                                .commentsIfFalse = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .noUnfitAnimals?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel.noUnfitAnimals
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .noUnfitAnimals?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel.noUnfitAnimals
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Visibility(
                                      visible: (certificateModel
                                                  .noUnfitAnimals.isTrue !=
                                              null &&
                                          !certificateModel
                                              .noUnfitAnimals.isTrue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 14),
                                          decoration:
                                              textFieldDecoration("Reason"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel.noUnfitAnimals
                                                .commentsIfFalse = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .pregnantAnimalsAreNotMixedWithYoungerOnes
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .pregnantAnimalsAreNotMixedWithYoungerOnes
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .pregnantAnimalsAreNotMixedWithYoungerOnes
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .pregnantAnimalsAreNotMixedWithYoungerOnes
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Visibility(
                                      visible: (certificateModel
                                                  .pregnantAnimalsAreNotMixedWithYoungerOnes
                                                  .isTrue !=
                                              null &&
                                          !certificateModel
                                              .pregnantAnimalsAreNotMixedWithYoungerOnes
                                              .isTrue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 14),
                                          decoration:
                                              textFieldDecoration("Reason"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel
                                                .pregnantAnimalsAreNotMixedWithYoungerOnes
                                                .commentsIfFalse = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .differentClassesOfAnimalsAreSeparated
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .differentClassesOfAnimalsAreSeparated
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .differentClassesOfAnimalsAreSeparated
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .differentClassesOfAnimalsAreSeparated
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Visibility(
                                      visible: (certificateModel
                                                  .differentClassesOfAnimalsAreSeparated
                                                  .isTrue !=
                                              null &&
                                          !certificateModel
                                              .differentClassesOfAnimalsAreSeparated
                                              .isTrue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 14),
                                          decoration:
                                              textFieldDecoration("Reason"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel
                                                .differentClassesOfAnimalsAreSeparated
                                                .commentsIfFalse = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .noDiseasedAnimals?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel.noDiseasedAnimals
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .noDiseasedAnimals?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel.noDiseasedAnimals
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Visibility(
                                      visible: (certificateModel
                                                  .noDiseasedAnimals.isTrue !=
                                              null &&
                                          !certificateModel
                                              .noDiseasedAnimals.isTrue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 14),
                                          decoration:
                                              textFieldDecoration("Reason"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel.noDiseasedAnimals
                                                .commentsIfFalse = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .animalsTranquilizedIfNeeded
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .animalsTranquilizedIfNeeded
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .animalsTranquilizedIfNeeded
                                              ?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .animalsTranquilizedIfNeeded
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Visibility(
                                      visible: (certificateModel
                                                  .animalsTranquilizedIfNeeded
                                                  .isTrue !=
                                              null &&
                                          !certificateModel
                                              .animalsTranquilizedIfNeeded
                                              .isTrue),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 14),
                                          decoration:
                                              textFieldDecoration("Reason"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel
                                                .animalsTranquilizedIfNeeded
                                                .commentsIfFalse = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          value: certificateModel
                                              .purposeOfTransportation,
                                          hint: Text("Choose One"),
                                          items: purposes.map((purpose) {
                                            return DropdownMenuItem<String>(
                                              value: purpose,
                                              child: Text(purpose),
                                            );
                                          }).toList(),
                                          onChanged: (val) {
                                            setState(() {
                                              certificateModel
                                                      .purposeOfTransportation =
                                                  val;
                                            });
                                          }),
                                    ),
                                    Visibility(
                                      visible: (certificateModel
                                                  .purposeOfTransportation !=
                                              null &&
                                          certificateModel
                                                  .purposeOfTransportation ==
                                              "Other"),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          style: TextStyle(fontSize: 16),
                                          decoration: textFieldDecoration(
                                              "Specify other purpose"),
                                          validator: (str) {
                                            return str.trim().isEmpty
                                                ? "Please fill valid data"
                                                : null;
                                          },
                                          onSaved: (val) {
                                            certificateModel
                                                .purposeOfTransportation = val;
                                          },
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
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                          groupValue: certificateModel
                                              .animalsHaveRequiredFeeds?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .animalsHaveRequiredFeeds
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("No"),
                                          value: false,
                                          groupValue: certificateModel
                                              .animalsHaveRequiredFeeds?.isTrue,
                                          onChanged: (bool value) {
                                            setState(() {
                                              certificateModel
                                                  .animalsHaveRequiredFeeds
                                                  .isTrue = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        style: TextStyle(fontSize: 14),
                                        decoration:
                                            textFieldDecoration("Mention Feed"),
                                        validator: (str) {
                                          return str.trim().isEmpty
                                              ? "Please fill valid data"
                                              : null;
                                        },
                                        onSaved: (val) {
                                          certificateModel
                                              .animalsHaveRequiredFeeds
                                              .commentsIfFalse = val;
                                        },
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
                                    child: DateTimePicker(
                                      type: DateTimePickerType.dateTime,
                                      dateMask: 'd MMM, yyyy hh:mm a',
                                      firstDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          0,
                                          0,
                                          0,
                                          0,
                                          0), //DateTime(2000),
                                      lastDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          23,
                                          59,
                                          59,
                                          0,
                                          0),
                                      icon: Icon(Icons.event),
                                      decoration:
                                          textFieldDecoration("Date and Time"),
                                      onChanged: (val) {
                                        certificateModel.transportationDetails
                                                .dateAndTime =
                                            DateFormat("yyyy-MM-dd hh:mm")
                                                .parse(val)
                                                .millisecondsSinceEpoch;
                                      },
                                      validator: (str) {
                                        return str.trim().isEmpty
                                            ? "Please fill valid data"
                                            : null;
                                      },
                                    ), /*TextFormField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Time"),
                                      validator: (str) {
                                        return str.trim().isEmpty
                                            ? "Please fill valid data"
                                            : null;
                                      },
                                      onSaved: (val) {
                                        certificateModel.transportationDetails
                                                .dateAndTime =
                                            DateTime.now()
                                                .millisecondsSinceEpoch;
                                      },
                                    ),*/
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Place"),
                                      validator: (str) {
                                        return str.trim().isEmpty
                                            ? "Please fill valid data"
                                            : null;
                                      },
                                      onSaved: (val) {
                                        certificateModel
                                            .transportationDetails.place = val;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration(
                                          "Mode of Transport"),
                                      validator: (str) {
                                        return str.trim().isEmpty
                                            ? "Please fill valid data"
                                            : null;
                                      },
                                      onSaved: (val) {
                                        certificateModel.transportationDetails
                                            .transportationMode = val;
                                      },
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DateTimePicker(
                                        type: DateTimePickerType.dateTime,
                                        dateMask: 'd MMM, yyyy hh:mm a',
                                        firstDate: DateTime.now(),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1),
                                        icon: Icon(Icons.event),
                                        decoration: textFieldDecoration(
                                            "Departure Time"),
                                        onChanged: (val) {
                                          certificateModel.transportationDetails
                                                  .departureTime =
                                              DateFormat("yyyy-MM-dd hh:mm")
                                                  .parse(val)
                                                  .millisecondsSinceEpoch;
                                        },
                                        validator: (str) {
                                          return str.trim().isEmpty
                                              ? "Please fill valid data"
                                              : null;
                                        },
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DateTimePicker(
                                        type: DateTimePickerType.dateTime,
                                        dateMask: 'd MMM, yyyy hh:mm a',
                                        firstDate: DateTime.now(),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1),
                                        icon: Icon(Icons.event),
                                        decoration:
                                            textFieldDecoration("Arrival Time"),
                                        onChanged: (val) {
                                          certificateModel.transportationDetails
                                                  .arrivalTime =
                                              DateFormat("yyyy-MM-dd hh:mm")
                                                  .parse(val)
                                                  .millisecondsSinceEpoch;
                                        },
                                        validator: (str) {
                                          return str.trim().isEmpty
                                              ? "Please fill valid data"
                                              : null;
                                        },
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x1A000000)),
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
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 14),
                                        decoration: textFieldDecoration(
                                            "Place of inspection"),
                                        validator: (str) {
                                          return str.trim().isEmpty
                                              ? "Please fill valid data"
                                              : null;
                                        },
                                        onSaved: (val) {
                                          certificateModel.inspectionPlace =
                                              val;
                                        },
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
                      value: certificateModel.isRule96Certified,
                      onChanged: (bool newValue) {
                        setState(() {
                          certificateModel.isRule96Certified = newValue;
                        });
                      },
                    ),
                    Card(
                        child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text("SCHEDULE - H",
                              style: TextStyle(fontSize: 14)),
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
                          child: DateTimePicker(
                            type: DateTimePickerType.dateTime,
                            dateMask: 'd MMM, yyyy hh:mm a',
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 1),
                            icon: Icon(Icons.event),
                            decoration: textFieldDecoration(
                                "Date and Time of the examination"),
                            onChanged: (val) {
                              certificateModel.inspectionDateAndTime =
                                  DateFormat("yyyy-MM-dd hh:mm")
                                      .parse(val)
                                      .millisecondsSinceEpoch;
                            },
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration("Cattle Species"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.cattleSpecies = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration(
                                "Name of the truck/Railway Wagon"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.wagonName = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: textFieldDecoration("Number of Cattle"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.numberOfCattle = int.parse(val);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration("Sex"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.sex = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration("Age"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.age = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration("Transport From"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.transportRouteDetails.from = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration("Transport To"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.transportRouteDetails.to = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration: textFieldDecoration("Via"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.transportRouteDetails.via = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 14),
                            decoration:
                                textFieldDecoration("Duration of the Journey"),
                            validator: (str) {
                              return str.trim().isEmpty
                                  ? "Please fill valid data"
                                  : null;
                            },
                            onSaved: (val) {
                              certificateModel.transportRouteDetails.duration =
                                  val;
                            },
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            ...secondCertificateCheckList.map(
                              (e) => CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: textFieldDecoration("Type"),
                                      validator: (str) {
                                        return str.trim().isEmpty
                                            ? "Please fill valid data"
                                            : null;
                                      },
                                      onSaved: (val) {
                                        certificateModel.vaccinationDetails
                                            .vaccineType = val;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DateTimePicker(
                                      type: DateTimePickerType.dateTime,
                                      dateMask: 'd MMM, yyyy hh:mm a',
                                      firstDate:
                                          DateTime(DateTime.now().year - 20),
                                      lastDate:
                                          DateTime(DateTime.now().year + 20),
                                      icon: Icon(Icons.event),
                                      decoration: textFieldDecoration("Date"),
                                      onChanged: (val) {
                                        certificateModel.vaccinationDetails
                                                .vaccinatedDate =
                                            DateFormat("yyyy-MM-dd hh:mm")
                                                .parse(val)
                                                .millisecondsSinceEpoch;
                                      },
                                      validator: (str) {
                                        return str.trim().isEmpty
                                            ? "Please fill valid data"
                                            : null;
                                      },
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
                        onPressed: validateAndSave),
                    Visibility(
                      visible: (valid != null && !valid),
                      child: Text(
                        "Please fill all the fields before proceeding",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ]),
                ),
              ),
            )));
  }

  validateAndSave() {
    setState(() {
      autoValidate = true;
    });
    checkListValues();
    FocusScope.of(context).unfocus();
    valid = validateCheckBoxes();
    if (valid) valid = _certificateKey.currentState.validate();
    if (valid) {
      _certificateKey.currentState.save();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnimalDetailsScreen(
                chosenAnimal: widget.chosenAnimal,
                certificateModel: certificateModel,
              )));
    }
  }

  validateCheckBoxes() {
    if (certificateModel.isRule96Certified == null ||
        certificateModel.isRule46To56Certified == null ||
        certificateModel.canAnimalsTravel12Hours == null ||
        certificateModel.canAnimalsTravel == null ||
        certificateModel.areAnimalsFed == null ||
        certificateModel.areAnimalsVaccinated == null ||
        certificateModel.areAnimalsFreeFromDiseases == null ||
        certificateModel.noUnfitAnimals == null ||
        certificateModel.pregnantAnimalsAreNotMixedWithYoungerOnes == null ||
        certificateModel.differentClassesOfAnimalsAreSeparated == null ||
        certificateModel.noDiseasedAnimals == null ||
        certificateModel.animalsTranquilizedIfNeeded == null) return false;
    return true;
  }

  checkListValues() {
    secondCertificateCheckList.forEach((e) {
      if (e.check.contains("46 to 56")) {
        certificateModel.isRule46To56Certified = e.isSelected;
      } else if (e.check.contains("12 hours before their departure")) {
        certificateModel.canAnimalsTravel12Hours = e.isSelected;
      } else if (e.check.contains("fit condition to travel")) {
        certificateModel.canAnimalsTravel = e.isSelected;
      } else if (e.check.contains("adequately fed and watered")) {
        certificateModel.areAnimalsFed = e.isSelected;
      } else if (e.check.contains("cattle have been vaccinated")) {
        certificateModel.areAnimalsVaccinated = e.isSelected;
      }
    });
  }

  textFieldDecoration(String labelText) {
    return InputDecoration(
      errorBorder: outLineBorder,
      focusedErrorBorder: focusedBorder,
      enabledBorder: outLineBorder,
      focusedBorder: focusedBorder,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      labelText: labelText,
    );
  }
}
