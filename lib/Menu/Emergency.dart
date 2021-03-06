import 'package:driver_conductor_app/shared/Styling/buttonStyles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:driver_conductor_app/shared/drawer.dart';
import 'package:driver_conductor_app/shared/constants.dart';
import 'package:driver_conductor_app/shared/styling/colors.dart';

Color factColor = Colors.orange.shade200;
Color factBoxColor = bgOrange;
Color helpBoxColor = bgOrange;
Color helpColor = Colors.orange.shade200;

var loading = false;

var _reportType = "";
var selectedReport = "";

final List<String> reportType = <String>[
  'Breakdown',
  'Protest on route',
  'Road inaccessible',
  'Road Accident'
];

class Emergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'Emergency',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          title: Text('Emergency'),
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: helpBoxColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              new DropdownButtonFormField(
                                hint: Text(
                                  'Select a report',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                value:
                                    _reportType.isNotEmpty ? _reportType : null,
                                items: reportType
                                    .map((value) => new DropdownMenuItem(
                                          value: value,
                                          child: Text('$value'),
                                        ))
                                    .toList(),
                                isExpanded: true,
                                onChanged: (val) => (() {
                                  _reportType = val.toString();
                                  selectedReport = val.toString();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }),
                                decoration: textInputDecorationNoHint(),
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async {
                              loading = true;
                              Fluttertoast.showToast(msg: "Report Sent!");
                              loading = false;
                            },
                            child: const Text('Proceed',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            style: raisedButtonStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: helpBoxColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text('Help',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: helpColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Text('Helpline No.',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Quicksand-SemiBold')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: helpColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Text('KeralaRTC Hub',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Quicksand-SemiBold')),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: factBoxColor),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            child: Text('Facts',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                          ),
                          SizedBox(height: 17),
                          Container(
                            decoration: BoxDecoration(
                              color: factColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('QR Scan',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                      'This module allows the conductor to scan the online booked tickets, currently it is under development',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            decoration: BoxDecoration(
                              color: factColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Bluetooth',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                      'To pair the app with the ticketing machine, a bluetooth transmitter chip is embedded to the main board to send all ticketing information to the app as transactions are processed.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            decoration: BoxDecoration(
                              color: factColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Emergency',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                      'This module is similar to the passenger???s help module, difference being the facts mention information regarding the conductor app.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          SizedBox(height: 17),
                          Container(
                            decoration: BoxDecoration(
                              color: factColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Passengers',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                      'To view the list of passengers currently travelling in the bus.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ),
                                SizedBox(height: 17),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
