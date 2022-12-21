import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomCircleAvatar extends StatelessWidget {
  final IconData icon;
  const CustomCircleAvatar({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child:                         CircleAvatar(
        radius: 21.r,
        backgroundColor: const Color(0xff6D2B70),
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor:  Colors.white,
          child:  Icon(
            icon,
            color: const Color(0xff6D2B70),
          ),
        ),
      ),
    );
  }
}
