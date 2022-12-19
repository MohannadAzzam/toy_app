
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class TestPage extends StatelessWidget {
  // void Function()? onPressed;
  // final double bottomMargin;
  // final double topMargin;
  // final double rightMargin;
  // final double leftMargin;
  // final double height;
  // final double width;
  // final String text;

  const TestPage({
    Key? key,
    // required this.bottomMargin,
    // required this.topMargin,
    // required this.rightMargin,
    // required this.leftMargin,
    // required this.height,
    // required this.width,
    // required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 100, right: 5, left: 5),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xff911D74),
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                height: 60.h,
                width: 294.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      MyIcons.ticket,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomText(
                        textText: "text", color: Colors.white, fontSize: 20)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
