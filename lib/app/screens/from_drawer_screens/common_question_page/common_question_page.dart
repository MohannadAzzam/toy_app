import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/common_question_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/common_question_page/widgets/custtom_common_question.dart';
import 'package:toy_app/my_icons_icons.dart';

class CommonQuestionPage extends StatelessWidget {
  const CommonQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'الأسئلة الشائعة', color: Colors.white, fontSize: 18),
          elevation: 0.r,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body: ListView.builder(
          itemCount: commonQuestionList.length  ,
            itemBuilder: (context, index) =>
            CustomCommonQuestion(commonQuestion: commonQuestionList[index])),
      ),
    );
  }
}