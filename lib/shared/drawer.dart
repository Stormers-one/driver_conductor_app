import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:driver_conductor_app/Menu/Booking/bookings_list.dart';
import 'package:driver_conductor_app/Menu/help.dart';
import 'package:driver_conductor_app/Menu/reports.dart';
import 'package:driver_conductor_app/User/profile.dart';
import 'package:driver_conductor_app/homepage.dart';
import 'package:driver_conductor_app/driver/map.dart';
import 'package:driver_conductor_app/shared/loading.dart';
import 'constants.dart';
import 'package:driver_conductor_app/homepage.dart';
import 'package:driver_conductor_app/shared/underDevelopment.dart';
import 'package:driver_conductor_app/shared/colors.dart';
import 'package:driver_conductor_app/homepage.dart';
import 'package:driver_conductor_app/User/user_count.dart';

class DrawerBuild extends StatefulWidget {
  _DrawerBuild createState() => _DrawerBuild();
}

class _DrawerBuild extends State<DrawerBuild> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: red,
            ),
            child: Text(
              'Odu Komban',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Quicksand-Bold',
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home',
                style: TextStyle(
                  fontFamily: 'Quicksand-Bold',
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.message),
          //   title: Text('Conductor Pages',style: TextStyle(fontFamily: 'Quicksand-Bold',)),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Conductor()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.account_circle),
          //   title: Text('Users List',style: TextStyle(fontFamily: 'Quicksand-Bold',)),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => UsersCount()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile',
                style: TextStyle(
                  fontFamily: 'Quicksand-Bold',
                )),
            onTap: () async {
              setState(() {
                Loading();
              });
              await getim();
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              });
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Under Dev',style: TextStyle(fontFamily: 'Quicksand-Bold',)),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => UnderDev()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.report),
          //   title: Text('Report',style: TextStyle(fontFamily: 'Quicksand-Bold',)),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Reports()),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help',
                style: TextStyle(
                  fontFamily: 'Quicksand-Bold',
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.help),
            title: Text('Driver App - Map',
                style: TextStyle(
                  fontFamily: 'Quicksand-Bold',
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DriverMap()),
              );
            },
          ),
        ],
      ),
    );
  }
}