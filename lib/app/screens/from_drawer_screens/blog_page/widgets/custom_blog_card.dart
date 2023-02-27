import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import '../../../../controllers/blog_controller.dart';
import '../blog_details_page.dart';

class CustomBlogCard extends StatelessWidget {
  // final BlogData blogData;
  // final void Function()? onTap;

  CustomBlogCard({
    Key? key,
    /* required this.blogData, this.onTap*/
  }) : super(key: key);
  final BlogController _blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _blogController.fetchBlog(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => const BlogDetailsPage(
                          ),arguments: snapshot.data![index]);
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
                            image: NetworkImage(
                              snapshot.data![index].image,
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Container(
                        // color: Colors.blue,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                textText: snapshot.data![index].name,
                                color: Colors.white,
                                fontSize: 18),
                            CustomText(
                                textText: "${snapshot.data![index].createdAt}"
                                    .substring(0, 10),
                                color: const Color(0xffC1C1C1),
                                fontSize: 16)
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
