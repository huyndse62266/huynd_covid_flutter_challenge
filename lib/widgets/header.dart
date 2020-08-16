import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final widthScreen = deviceSize.width;
    final heightScreen = deviceSize.height;
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: deviceSize.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: heightScreen * 0.10,
                left: widthScreen * 0.4,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30, left: 50),
                  child: Text(
                    'Covid-19 Tracker',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Positioned(
              left: widthScreen * 0.5,
              top: 10,
              child: SizedBox(
                width: 50,
                height: 50,
                child: FlareActor(
                  'assets/corona_green.flr',
                  fit: BoxFit.fill,
                  animation: "move",
                ),
              ),
            ),
            Positioned(
              left: widthScreen * 0.7,
              top: 10,
              child: SizedBox(
                width: 50,
                height: 50,
                child: FlareActor(
                  'assets/corona_green.flr',
                  fit: BoxFit.fill,
                  animation: "move",
                ),
              ),
            ),
            Positioned(
              right: 100,
              top: heightScreen * 0.15,
              child: SizedBox(
                width: 50,
                height: 50,
                child: FlareActor(
                  'assets/corona_green.flr',
                  fit: BoxFit.fill,
                  animation: "move",
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: SvgPicture.asset(
                'assets/coronadr.svg',
                width: deviceSize.width * 0.5,
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
