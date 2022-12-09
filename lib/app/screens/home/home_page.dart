import 'package:flutter/material.dart';
import 'package:toy_app/my_icons_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6D2B70),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 31,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xff6D2B70),
                  child: Icon(MyIcons.ionic_ios_arrow_back, size: 24, color: Colors.white),
                ),
              ),
              CircleAvatar(
                radius: 31,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xff6D2B70),
                  child: Icon(MyIcons.facebook, size: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
