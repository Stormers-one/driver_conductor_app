import 'package:flutter/material.dart';
import 'package:driver_conductor_app/shared/services/mapServices/mapState.dart';
import 'package:driver_conductor_app/shared/model/user.dart';
import 'package:driver_conductor_app/shared/services/firebaseServices/auth.dart';
import 'package:driver_conductor_app/shared/spashScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: MapState(),
    )
  ], child: Odukomban()));
}

class Odukomban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: User(),
      value: Authservice().user,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Quicksand-Medium'),
        home: SplashScreen(),
      ),
    );
  }
}
