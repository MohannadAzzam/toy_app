import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/models/home/bolg_data.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/blog_page/blog_details_page.dart';

class CustomBlogCard extends StatelessWidget {
  final BlogData blogData;
  final void Function()? onTap;

  const CustomBlogCard({Key? key, required this.blogData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () {
        Get.to(() => BlogDetailsPage(blogData: blogData));
      //   // Navigator.push(
      //   //     context,
      //   //     MaterialPageRoute(
      //   //         builder: (context)=> BlogDetailsPage(blogData: blogData)));
      },
      child: Container(
        height: 225.h,
        width: 400.w,
        margin: EdgeInsets.only(
            top: 10.h, left: 10.w, right: 10.w, bottom: 5.h),
        decoration: BoxDecoration(
          // color: Colors.transparent,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(
                blogData.blogImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          // color: Colors.blue,
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                  textText: "${blogData.blogName}",
                  color: Colors.white,
                  fontSize: 18),
              CustomText(
                  textText: "${blogData.blogDate}",
                  color: Color(0xffC1C1C1),
                  fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}
