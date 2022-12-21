import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toy_app/app/data/models/common_question.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomCommonQuestion extends StatelessWidget {
  final CommonQuestion commonQuestion;

  const CustomCommonQuestion({Key? key, required this.commonQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
      child: ScrollOnExpand(
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: false,
              ),
              header: Container(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(5.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomText(
                              textText: commonQuestion.question,
                              color: Colors.black,
                              fontSize: 16)),
                      ExpandableIcon(
                        theme: ExpandableThemeData(

                          expandIcon: Icons.add,
                          collapseIcon: Icons.remove,
                          iconColor: Colors.grey,
                          iconSize: 24.r,
                          iconRotationAngle: 3.14.r / 2.r,
                          iconPadding: EdgeInsets.only(right: 5.w, left: 5.w),
                          hasIcon: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(commonQuestion.answer)),
            ),
          ],
        ),
      ),
    ));
  }
}
