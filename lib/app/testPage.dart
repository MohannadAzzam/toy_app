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
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){

            },
            child: Container(
              // margin: EdgeInsets.only(top: 25,left: 20),
              height: 180.h,
              width: 248.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage("assets/images/visitor_acc.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Icon(
                      MyIcons.person,
                      size: 30.r,
                      color: Colors.white,
                    ),
                  ),
                  const CustomText(
                      textText: "حساب زائر", color: Colors.white, fontSize: 20)
                ],
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 25,left: 20),
            height: 180.h,
            width: 248.w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage("assets/images/exhibtor_acc.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: Icon(
                    MyIcons.person,
                    size: 30.r,
                    color: Colors.white,
                  ),
                ),
                const CustomText(
                    textText: "حساب عارض", color: Colors.white, fontSize: 20)
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 25,left: 20),
            height: 180.h,
            width: 248.w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage("assets/images/sponsor_acc.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: Icon(
                    MyIcons.person,
                    size: 30.r,
                    color: Colors.white,
                  ),
                ),
                const CustomText(
                    textText: "حساب راعي", color: Colors.white, fontSize: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
