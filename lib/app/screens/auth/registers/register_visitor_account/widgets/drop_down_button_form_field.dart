import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class CustomDropDownButtonFormField extends StatelessWidget {

  final  Function(String?)? onChange;

  const CustomDropDownButtonFormField({Key? key, this.onChange}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      height: 60.h,
      width: 320.w,
      child: DropdownButtonFormField(
        validator: (val){
          if(val! == null){
            return "يرجى اختيار دولتك";
          }
        },
          hint:
              CustomText(textText: "الدولة", color: Colors.black, fontSize: 18),
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
          items: ['السعودية', 'الإمارات', 'مصر']
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style:
                      TextStyle(
                          fontFamily: 'din-next-lt-w23',
                          color: Colors.black,
                          // height: height,
                          fontSize: 18.sp,
                          // fontWeight: fontWeight
                      ),
                    ),
                  ))
              .toList(),
            // value: "",
          onChanged: onChange),
    );
  }
}
