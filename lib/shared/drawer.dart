import 'package:driver_conductor_app/User/profile.dart';
import 'package:driver_conductor_app/homepage.dart';
import 'package:driver_conductor_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:driver_conductor_app/shared/Styling/colors.dart';

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
              // setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
              // });
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
        ],
      ),
    );
  }
}
