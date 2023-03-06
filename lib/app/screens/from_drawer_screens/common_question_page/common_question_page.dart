import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/common_question_page/widgets/custtom_common_question.dart';

class CommonQuestionPage extends StatelessWidget {
  const CommonQuestionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: "commonQuestions", color: Colors.white, fontSize: 18),
          elevation: 0.r,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
              //     }),
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: CustomCommonQuestion()
        );
  }
}
