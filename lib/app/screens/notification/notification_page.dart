import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:

        const Center(
        child:
            CustomText(
              textAlign: TextAlign.center,
                textText: "This page didn't have any design in xd",
                color: Colors.black,
                fontSize: 30) ,
        ),
    );
  }
}
