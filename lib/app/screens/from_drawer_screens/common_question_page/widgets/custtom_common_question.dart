import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import '../../../../controllers/common_question_controller.dart';

class CustomCommonQuestion extends StatelessWidget {
  // final CommonQuestion commonQuestion;

  CustomCommonQuestion({
    Key? key,
    /*required this.commonQuestion*/
  }) : super(key: key);
  final CommonQuestionController _commonQuestionController =
      Get.put(CommonQuestionController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _commonQuestionController.fetchCommonQuestion(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ExpandableNotifier(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                        child: ScrollOnExpand(
                          child: Column(
                            children: <Widget>[
                              ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: true,
                                  hasIcon: false,
                                ),
                                header: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: EdgeInsets.all(5.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: CustomText(
                                              textText: snapshot.data![index].answer,
                                              color: Colors.black,
                                              fontSize: 16)),
                                      ExpandableIcon(
                                        theme: ExpandableThemeData(
                                          expandIcon: Icons.add,
                                          collapseIcon: Icons.remove,
                                          iconColor: Colors.grey,
                                          iconSize: 24.r,
                                          iconRotationAngle: 3.14.r / 2.r,
                                          iconPadding:
                                          EdgeInsets.only(right: 5.w, left: 5.w),
                                          hasIcon: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                collapsed: Container(),
                                expanded: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 3),
                                    child: CustomText(
                                        textText: snapshot.data![index].question,
                                        color: Colors.black,
                                        height: 1.3,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      ));
                });
          }
          return const Center(child: CircularProgressIndicator(),);
        });
  }
}
