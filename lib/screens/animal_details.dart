import 'package:animal_welfare/auth/authentication.dart';
import 'package:animal_welfare/common/dialogs.dart';
import 'package:animal_welfare/model/certificate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimalDetailsScreen extends StatefulWidget {
  static const String routeName = '/AnimalDetailsScreen';

  final String chosenAnimal;
  Certificate certificateModel;
  AnimalDetailsScreen({@required this.chosenAnimal, this.certificateModel});

  @override
  AnimalDetailsState createState() {
    return AnimalDetailsState();
  }
}

class Purpose {
  String purpose;
  bool isSelected;
  Purpose({@required this.purpose, @required this.isSelected});
}

class AnimalDetailsState extends State<AnimalDetailsScreen> {
  final outLineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x1A000000)),
      borderRadius: BorderRadius.circular(5));
  final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2E2E2E)),
      borderRadius: BorderRadius.circular(5));

  int gender;

  List<Purpose> purposeList = [
    Purpose(purpose: "Fit for Breeding purpose", isSelected: false),
    Purpose(purpose: "Fit for Draught purpose", isSelected: false),
    Purpose(purpose: "Fit for Milking purpose", isSelected: false)
  ];
  List<AnimalDetails> animalDetailsList = [AnimalDetails()];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF3F7FF),
            appBar: AppBar(
              title: Text(widget.chosenAnimal),
            ),
            body: ListView(
                // reverse: true,
                controller: _scrollController,
                children: <Widget>[
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
                              animalDetailsList.add(AnimalDetails());
                            });
                            double offSet =
                                (600 * (animalDetailsList.length - 1)) / 1;
                            _scrollController.animateTo(offSet,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 300));
                          })
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ...animalDetailsList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextFormField(
                                      style: TextStyle(fontSize: 16),
                                      decoration:
                                          textFieldDecoration("Species"),
                                      onChanged: (val) {
                                        e.species = val;
                                      },
                                    ),
                                    SizedBox(height: 4),
                                    TextFormField(
                                      style: TextStyle(fontSize: 16),
                                      decoration: textFieldDecoration("Breed"),
                                      onChanged: (val) {
                                        e.breed = val;
                                      },
                                    ),
                                    SizedBox(height: 4),
                                    TextFormField(
                                      style: TextStyle(fontSize: 16),
                                      decoration: textFieldDecoration("Age"),
                                      onChanged: (val) {
                                        e.age = val;
                                      },
                                    ),
                                    SizedBox(height: 4),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                      ],
                                      style: TextStyle(fontSize: 16),
                                      decoration: textFieldDecoration(
                                          "Number of Male animals"),
                                      onChanged: (val) {
                                        e.sexAndCount.maleCount =
                                            int.parse(val);
                                      },
                                    ),
                                    SizedBox(height: 4),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                      ],
                                      style: TextStyle(fontSize: 16),
                                      decoration: textFieldDecoration(
                                          "Number of Female animals"),
                                      onChanged: (val) {
                                        e.sexAndCount.femaleCount =
                                            int.parse(val);
                                      },
                                    ),
                                    SizedBox(height: 4),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 16),
                                      decoration:
                                          textFieldDecoration("Description"),
                                      onChanged: (val) {
                                        e.coatDescription = val;
                                      },
                                    ),
                                    SizedBox(height: 4),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style: TextStyle(fontSize: 16),
                                      decoration: textFieldDecoration(
                                          "Breed and Identification marks"),
                                      onChanged: (val) {
                                        e.breedAndIdMarks = val;
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        "Please check wherever applicable",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text("Fit for Breeding purpose"),
                                      value: e.isFitForBreeding,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          e.isFitForBreeding = newValue;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text("Fit for Draught purpose"),
                                      value: e.isFitForDraughtPurpose,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          e.isFitForDraughtPurpose = newValue;
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text("Fit for Milking purpose"),
                                      value: e.isFitForMilkingPurpose,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          e.isFitForMilkingPurpose = newValue;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Color(0xFF2E2E2E),
                    child: Text(
                      "Issue Certificate",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      widget.certificateModel.animalDetails = animalDetailsList;
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
                          .createCertificate(widget.certificateModel)
                          .then((onValue) {
                        Navigator.of(context).pop();
                        if (onValue['status'] == 200) {
                          showDialog(
                              context: context,
                              builder: (context) => CommonAlertDialog(
                                    title: Text("Certificate issued successfully!"),
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
                                          Navigator.of(context)..pop()..pop()..pop();
                                        },
                                      ),
                                    ],
                                  ));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                ErrorDialog(title: onValue["message"]),
                          );
                        }
                      });
                    },
                  ),
                ])));
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
