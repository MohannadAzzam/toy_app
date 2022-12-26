import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomDropDownButtonFormField extends StatelessWidget {
  const CustomDropDownButtonFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      height: 60.h,
      width: 320.w,
      child: DropdownButtonFormField(
          hint: Text(
            'الدولة',
            style: GoogleFonts.cairo(fontSize: 18, color: Colors.black),
          ),
          borderRadius: BorderRadius.circular(10),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              MyIcons.location,
              color: Color(0xff6D2B70),
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          items: ['السعودية', 'الإمارات', 'البحرين', 'قطر', 'الكويت']
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style:
                          GoogleFonts.cairo(fontSize: 18, color: Colors.black),
                    ),
                  ))
              .toList(),
          onChanged: (val) {}),
    );
  }
}
