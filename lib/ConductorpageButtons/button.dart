import 'package:flutter/material.dart';

import 'package:driver_conductor_app/User/user_count.dart';
import 'package:driver_conductor_app/Menu/Emergency.dart';
import 'package:driver_conductor_app/Menu/QR_Scan.dart';
// import '../homepageButtons/buttonClass.dart';
import '../shared/styling/colors.dart';
// import '../homepageButtons/data.dart';

class Button extends StatelessWidget {
  final String image;
  final String route;
  final String text;
  final BuildContext context;
  final int index = 0;
  Button(
      {required this.image,
      required this.route,
      required this.text,
      required this.context});
  // @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RawMaterialButton(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.transparent)),
          fillColor: orange,
          splashColor: Colors.grey,
          textStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Image.asset(
                  image,
                ),
                height: 100,
                width: 100,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 2.0),
              ),
              Text(text,
                  style: TextStyle(
                    fontFamily: 'Quicksand-Bold',
                  )),
            ],
          ),
          onPressed: () {
            _navigate(route);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void _navigate(String route) {
    // Navigator.of(context).pushNamed('/$route');
    if (route == 'QR_Scan') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QRScan()),
      );
    } else if (route == 'Emergency') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Emergency()),
      );
    } else if (route == 'Passengers') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UsersCount()),
      );
    }
  }

//   Widget _imageAvatar(PostClass post, BuildContext context) {
//     return FloatingActionButton(
//       child: Icon(Icons.person),
//       // child: Container(
//       //   child: Image.asset('asset/user.jpg'),
//       //   height: 25,
//       // ),
//       backgroundColor: raspColor,
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => User()),
//         );
//       },
//     );
//   }

//   Widget _imageBackground(PostClass post) {
//     return Container(
//       constraints: BoxConstraints.expand(),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Image.network(
//           post.image,
//           fit: BoxFit.fitWidth,
//         ),
//       ),
//     );
//   }

//   Widget _nameOfUser(PostClass post) {
//     return Container(
//         child: Text(
//       post.name,
//       style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
//     ));
//   }

//   Widget _locationOfUser(PostClass post) {
//     return Container(
//         child: Text(
//       post.location,
//       style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
//     ));
//   }

//   Widget _captionOfUser(PostClass post) {
//     return Container(
//         child: Text(
//       post.caption,
//       style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
//     ));
//   }
}

typedef VoidNavigate = void Function(String route);
