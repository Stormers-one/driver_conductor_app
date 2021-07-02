import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:driver_conductor_app/shared/model/user.dart';
import 'package:driver_conductor_app/Shared/services/firebaseServices/database.dart';
import 'package:driver_conductor_app/shared/Styling/colors.dart';
import 'package:driver_conductor_app/shared/constants.dart';
import 'package:driver_conductor_app/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDisplay extends StatefulWidget {
  final value;
  TicketDisplay(this.value);

  @override
  State<TicketDisplay> createState() => _TicketDisplayState(value);
}

class _TicketDisplayState extends State<TicketDisplay> {
  final value;
  _TicketDisplayState(this.value);
  bool ver = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
          elevation: 0,
          title: Text('Ticket Verification'),
          backgroundColor: red,
          actions: <Widget>[]),
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          new TextField(
                            enabled: false,
                            decoration: new InputDecoration(
                              labelText: widget.value['bookID'],
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              icon: Icon(Icons.vpn_key),
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          new TextField(
                            enabled: false,
                            decoration: new InputDecoration(
                              labelText: widget.value['name'],
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              icon: Icon(Icons.account_box),
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          new TextField(
                            enabled: false,
                            decoration: new InputDecoration(
                              labelText: widget.value['from'],
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              icon: Icon(Icons.play_circle_outline),
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          new TextField(
                            enabled: false,
                            decoration: new InputDecoration(
                              labelText: widget.value['to'],
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              icon: Icon(Icons.stop),
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          new TextField(
                            enabled: false,
                            decoration: new InputDecoration(
                              labelText: widget.value['phno'],
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              icon: Icon(Icons.stop),
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          FutureBuilder(
                              future:
                                  ticketVerify(value['bookID'], value['uid']),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  print(snapshot.data);
                                  if (snapshot.data.toString() == "true") {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Image.asset(
                                              'assets/images/verified.png'),
                                        ),
                                        Text(
                                          "Verified",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Image.asset(
                                                'assets/images/not.png')),
                                        Text(
                                          "Not Verified",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20),
                                        ),
                                      ],
                                    );
                                  }
                                }
                                return Loading();
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> ticketVerify(String bid, String uid) async {
    bool exist = true;
    await FirebaseFirestore.instance
        .collection('Bookings')
        .doc(bid)
        .get()
        .then((onexist) {
      onexist.exists ? exist = true : exist = false;
    });
    print("The doc existence: $exist");
    return exist;
  }
}
