import 'package:flutter/material.dart';
import 'package:driver_conductor_app/shared/drawer.dart';
import 'package:driver_conductor_app/shared/styling/colors.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class QRScan extends StatelessWidget {
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
                children: <Widget>[],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
