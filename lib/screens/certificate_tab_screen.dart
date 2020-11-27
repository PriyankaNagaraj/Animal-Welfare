import 'package:animal_welfare/screens/certificate_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    var sSize = MediaQuery.of(context).size;
    List<String> animals = ["Cattle", "Dog", "Cat", "Horse"];
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
                height: sSize.height - 132,
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
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                  Center(
                      child:
                          Text("Coming Soon", style: TextStyle(fontSize: 20)))
                ]),
              )
            ],
          ),
        ));
  }
}
