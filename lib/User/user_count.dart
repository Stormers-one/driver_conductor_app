import 'package:flutter/material.dart';
import 'package:driver_conductor_app/User/profile_settings.dart';
import 'package:driver_conductor_app/services/database.dart';
import 'package:driver_conductor_app/User/user_list.dart';
import 'package:driver_conductor_app/User/users_fetch.dart';
import 'package:driver_conductor_app/shared/drawer.dart';
import 'package:driver_conductor_app/shared/colors.dart';
import 'package:provider/provider.dart';

class UsersCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // void _showSettengsPanel() {
    //   showModalBottomSheet(
    //       context: context,
    //       builder: (context) {
    //         return Container(
    //           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
    //           child: SettingsForm(),
    //         );
    //       });
    // }
    return StreamProvider<List<Users>>.value(
      value: DatabaseService().users,
      child: MaterialApp(
        title: 'Homepage',
        home: Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            elevation: 0,
            title: Text('Passengers'),
            backgroundColor: red,
            // actions: <Widget>[
            //   FlatButton.icon(
            //       onPressed: () => _showSettengsPanel(),
            //       icon: Icon(Icons.settings),
            //       label: Text('Edit Profile'))
            // ],
          ),
          drawer: DrawerBuild(),
          body: UserList(),
        ),
      ),
    );
  }
}
