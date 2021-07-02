import 'package:driver_conductor_app/Menu/ticketVerify.dart';
import 'package:flutter/material.dart';
import 'package:driver_conductor_app/shared/drawer.dart';
import 'package:driver_conductor_app/shared/styling/colors.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';

class QRScan extends StatefulWidget {
  @override
  State<QRScan> createState() => _QRScanState();
}

String? out = "";

class _QRScanState extends State<QRScan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand-Medium'),
      title: 'QR Scan',
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          elevation: 0,
          title: Text('QR Scan'),
          backgroundColor: red,
        ),
        drawer: DrawerBuild(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.width / 20),
                          height: MediaQuery.of(context).size.height / 3.1,
                          child: Center(
                            child: Text(
                              "Scan the QR CODE of the Passenger to verify the Ticket",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Image.asset(
                                        'assets/images/verified.png')),
                                Text(
                                  "Verified",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child:
                                        Image.asset('assets/images/not.png')),
                                Text("Not Verified",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 5,
                        width: MediaQuery.of(context).size.width / 5,
                        child: FloatingActionButton(
                            backgroundColor: orange,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(child: Icon(Icons.camera)),
                                  Text(
                                    "Scan",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20),
                                  )
                                ]),
                            onPressed: () async {
                              if (await Permission.camera.request().isGranted) {
                                String? cameraScanResult = await scanner.scan();
                                setState(() {
                                  out = cameraScanResult;
                                });
                              }
                              Map value = jsonDecode((out.toString()));
                              print(value);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TicketDisplay(value)));
                            }),
                      ),
                    ],
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
