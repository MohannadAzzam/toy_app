import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/account_type/custom_acc_type.dart';
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
                Get.back();
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
                    height: 25.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const RegisterVisitorAccountPage());
                    },
                    child: const CustomAccType(
                        image: "assets/images/visitor_acc.png",
                        name: "حساب زائر",
                        icon: MyIcons.person),
                  ),
                  const SizedBox(height: 20,), InkWell(
                    onTap: () {
                      Get.to(() => const registerViewerAccountPage());
                    },
                    child: const CustomAccType(
                        image: "assets/images/exhibtor_acc.png",
                        name: "حساب عارض",
                        icon: MyIcons.store),
                  ),
                  const SizedBox(height: 20,),
                  const InkWell(
                    child: CustomAccType(
                        image: "assets/images/sponsor_acc.png",
                        name: "حساب راعي",
                        icon: MyIcons.sponsors),
                  ),
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
