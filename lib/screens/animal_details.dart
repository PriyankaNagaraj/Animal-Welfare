import 'package:flutter/material.dart';

class AnimalDetails extends StatefulWidget {
  static const String routeName = '/AnimalDetailsScreen';

  final String chosenAnimal;
  AnimalDetails({@required this.chosenAnimal});

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

class AnimalDetailsState extends State<AnimalDetails> {
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
  List<String> animalDetails = ["animalDetails"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF3F7FF),
            appBar: AppBar(
              title: Text(widget.chosenAnimal),
            ),
            body: ListView(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:
                        Text("Animal Details", style: TextStyle(fontSize: 16)),
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
                                decoration: textFieldDecoration("Description"),
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
