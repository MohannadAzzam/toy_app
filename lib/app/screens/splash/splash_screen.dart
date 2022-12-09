import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/splash_image.png')),
            Text(
              'معرض الرياض',
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(fontSize: 30),
                  color: Color(0xff911D74),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'لألعـــــــاب الأطفــــــــــال',
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(fontSize: 20),
                  color: Color(0xff949494),
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
