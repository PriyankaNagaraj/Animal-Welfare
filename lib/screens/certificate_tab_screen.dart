import 'package:animal_welfare/auth/authentication.dart';
import 'package:animal_welfare/model/fetched_cert_model.dart';
import 'package:animal_welfare/screens/certificate_screen.dart';
import 'package:animal_welfare/screens/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        return;
      }
      if (_tabController.index == 1) {
        fetchCertificates();
      }
    });
    fetchCertificates();
  }

  fetchCertificates() {
    fetchedCertificatesList = authentication.fetchCertificates();
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
                    FutureBuilder(
                      future: fetchedCertificatesList,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List certificates = snapshot.data;
                        if (certificates.isEmpty) {
                          return Center(
                              child: Text("Not Certificates Issued Yet",
                                  style: TextStyle(fontSize: 20)));
                        }

                        return ListView.builder(
                            itemCount: certificates.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "Issued On: ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                                DateFormat("yyyy-MM-dd hh:mm")
                                                    .format(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            certificates[index]
                                                                .issuedOn)),
                                                style: TextStyle(fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          "Place of Inspection: ${certificates[index].inspectionPlace}",
                                          style: TextStyle(fontSize: 16)),
                                      RaisedButton(
                                          color: Color(0xFF2E2E2E),
                                          child: Text(
                                            "View Certificate",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) => PdfView(
                                                        id: certificates[index]
                                                            .id,
                                                        pdfFileUrl: certificates[
                                                                index]
                                                            .certificateDownloadUrl)));
                                          })
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
