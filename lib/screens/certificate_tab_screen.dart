import 'package:animal_welfare/auth/authentication.dart';
import 'package:animal_welfare/model/fetched_cert_model.dart';
import 'package:animal_welfare/screens/certificate_screen.dart';
import 'package:animal_welfare/screens/pdf_viewer.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CertificateTabScreen extends StatefulWidget {
  static const String routeName = '/CertificateTabScreen';
  @override
  CertificateTabScreenState createState() {
    return CertificateTabScreenState();
  }
}

class CertificateTabScreenState extends State<CertificateTabScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  Future fetchedCertificatesList;
  int from;
  int to;
  TextEditingController fromController;
  TextEditingController toController;

  final outLineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x1A000000)),
      borderRadius: BorderRadius.circular(5));
  final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2E2E2E)),
      borderRadius: BorderRadius.circular(5));
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fromController = TextEditingController();
    toController = TextEditingController();

    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        return;
      }
      if (_tabController.index == 1) {
        fetchedCertificatesList = fetchCertificates();
      }
    });
    fetchedCertificatesList = fetchCertificates();
  }

  fetchCertificates() async {
    return await authentication.fetchCertificates(from, to);
  }

  Future _onRefresh() async {
    setState(() {
      fetchedCertificatesList = fetchCertificates();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var sSize = MediaQuery.of(context).size;
    List<String> animals = ["Cattle"];
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Color(0xFFF3F7FF),
          appBar: AppBar(
            title: Text("Animal Welfare Board"),
          ),
          body: Column(
            children: <Widget>[
              TabBar(
                  labelColor: Color(0xFF2E2E2E),
                  controller: _tabController,
                  indicatorColor: Color(0xFF2E2E2E),
                  tabs: <Widget>[
                    Container(
                      height: 50,
                      child: Center(
                        child: Text("Issue New Certificate",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.4,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Center(
                        child: Text("Issued Certificates",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.4,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ]),
              Container(
                height: 1,
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            width: sSize.width,
                            height: 50,
                            color: Color(0xFF9B9B9B),
                            child: Center(
                                child: Text(
                              "Choose Animal",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: animals.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CertificateScreen(
                                                        chosenAnimal:
                                                            animals[index])));
                                      },
                                      title: Text(animals[index],
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)));
                                }))
                      ],
                    ),
                    Flex(direction: Axis.vertical, children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Filter Certificates",
                            style: TextStyle(fontSize: 16)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Form(
                            key: _formKey,
                            child: Column(children: [
                              Expanded(
                                child: DateTimeField(
                                  style: TextStyle(fontSize: 16),
                                  decoration: textFieldDecoration("From"),
                                  format: DateFormat("d/MM/yyyy hh:mm a"),
                                  onChanged: (val) {
                                    if (val == null) {
                                      from = null;
                                      if (from == null && to == null) {
                                        setState(() {
                                          fetchedCertificatesList = fetchCertificates();
                                        });
                                      }
                                    } else
                                      setState(() {
                                        from = val.millisecondsSinceEpoch;
                                      });
                                  },
                                  validator: (dateTime) {
                                    return dateTime == null
                                        ? "Please fill valid data"
                                        : null;
                                  },
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate:
                                            DateTime(DateTime.now().year - 10),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime.now());
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                child: DateTimeField(
                                  style: TextStyle(fontSize: 16),
                                  decoration: textFieldDecoration("To"),
                                  format: DateFormat("d/MM/yyyy hh:mm a"),
                                  onChanged: (val) {
                                    if (val == null) {
                                      to = null;
                                      if (from == null && to == null) {
                                        setState(() {
                                          fetchedCertificatesList = fetchCertificates();
                                        });
                                      }
                                    } else
                                      setState(() {
                                        to = val.millisecondsSinceEpoch;
                                      });
                                  },
                                  validator: (dateTime) {
                                    return dateTime == null
                                        ? "Please fill valid data"
                                        : null;
                                  },
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate:
                                            DateTime(DateTime.now().year - 10),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime.now());
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: RaisedButton(
                                      color: Color(0xFF2E2E2E),
                                      child: Text(
                                        "DONE",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      onPressed: (from != null && to != null)
                                          ? () {
                                              setState(() {
                                                fetchedCertificatesList = fetchCertificates();
                                              });
                                            }
                                          : null),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      Expanded(
                          flex: 9,
                          child: FutureBuilder(
                              future: fetchedCertificatesList,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(snapshot.error.toString()),
                                  );
                                }
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                List certificates = snapshot.data;
                                if (certificates.isEmpty) {
                                  return Center(
                                      child: Text("No Certificates to show",
                                          style: TextStyle(fontSize: 20)));
                                }

                                return RefreshIndicator(
                                  onRefresh: _onRefresh,
                                  child: ListView.builder(
                                      itemCount: certificates.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Issued On: ",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                          DateFormat(
                                                                  "yyyy-MM-dd hh:mm")
                                                              .format(DateTime
                                                                  .fromMillisecondsSinceEpoch(
                                                                      certificates[
                                                                              index]
                                                                          .issuedOn)),
                                                          style: TextStyle(
                                                              fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                    "Place of Inspection: ${certificates[index].inspectionPlace}",
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                                RaisedButton(
                                                    color: Color(0xFF2E2E2E),
                                                    child: Text(
                                                      "View Certificate",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context).push(MaterialPageRoute(
                                                          builder: (context) => PdfView(
                                                              id: certificates[
                                                                      index]
                                                                  .id,
                                                              pdfFileUrl:
                                                                  certificates[
                                                                          index]
                                                                      .certificateDownloadUrl)));
                                                    })
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              }))
                    ])
                  ]),
                ),
              )
            ],
          ),
        ));
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
