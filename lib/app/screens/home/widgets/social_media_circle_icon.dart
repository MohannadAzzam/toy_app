import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaCircleIcons extends StatelessWidget {
  final IconData icon;
  const SocialMediaCircleIcons({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.r,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 23.r,
        backgroundColor: const Color(0xff6D2B70),
        child:  Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
