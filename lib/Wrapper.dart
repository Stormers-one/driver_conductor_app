import 'package:flutter/material.dart';
import 'package:driver_conductor_app/shared/services/firebaseServices/Signing_and_Auth/loginPage.dart';
import 'package:driver_conductor_app/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:driver_conductor_app/homepage.dart';
import 'package:driver_conductor_app/shared/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user.uid == null) {
      return LoginPage();
    } else {
      userID = user.uid;
      return Homepage();
    }
    //return Homepage();
  }
}
