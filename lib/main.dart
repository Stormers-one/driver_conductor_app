import 'package:flutter/material.dart';
import 'package:driver_conductor_app/driver/drive_state.dart';
import 'package:driver_conductor_app/shared/model/user.dart';
import 'package:driver_conductor_app/services/auth.dart';
import 'package:driver_conductor_app/shared/spashScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: DriveState(),
      )
    ], child: Odukomban()));

class Odukomban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Quicksand-Medium'),
        home: SplashScreen(),
      ),
    );
  }
}
