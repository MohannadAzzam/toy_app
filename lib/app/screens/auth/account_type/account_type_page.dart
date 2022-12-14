import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/login_page.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/auth/registers/register_viewer_account/register_viewer_account_page.dart';
import 'package:toy_app/app/screens/auth/registers/register_visitor_account/register_visitor_account_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/account_type_back.png'),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff6D2B70),
            leading: IconButton(
              onPressed: () {
                Get.to(() => const LoginPage());
              },
              icon: const Icon(MyIcons.ionic_ios_arrow_back),
            ),
          ),
          body: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      textText: 'اختر نوع الحساب',
                      color: Colors.white,
                      fontSize: 20),
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const RegisterVisitorAccountPage());
                      },
                      child: Image(
                        image: const AssetImage('assets/images/visitor_account.png'),
                        height: 165.h,
                        width: 215.w,
                      )),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => const registerViewerAccountPage());

                    },
                      child: Image(
                    image: const AssetImage('assets/images/viewer_account.png'),
                    height: 150.h,
                    width: 200.w,
                  )),
                  GestureDetector(
                      child: Image(
                    image: const AssetImage('assets/images/sponsor_account.png'),
                    height: 150.h,
                    width: 200.w,
                  )),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
