import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: Container(
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(top: 100, right: 5, left: 5),
            child: Container(
              height: 225.h,
              width: 400.w  ,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/blog_one.png',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                // color: Colors.blue,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                        textText: 'معرض الرياض لألعاب الأطفال',
                        color: Colors.white,
                        fontSize: 18),
                    CustomText(
                        textText: '22/04/2022',
                        color: Color(0xffC1C1C1),
                        fontSize: 16)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
