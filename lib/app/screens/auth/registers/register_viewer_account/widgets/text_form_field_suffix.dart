import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class TextFormFieldSuffex extends StatelessWidget {
  final void Function() onPressed;
  const TextFormFieldSuffex({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          onPressed: onPressed,
          minWidth: 76.w,
          color: const Color(0xffF5F5F5),
          height: 56.h,
          child: const CustomText(
              textText: 'استعراض',
              color: Colors.black,
              fontSize: 10),
        ),
      ),
    );
  }
}
