import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import '../../../controllers/home_controller.dart';

class CustomNewBlogCard extends StatelessWidget {
  // final HomeNewBlog homeNewBlog;

  CustomNewBlogCard({
    Key? key,
    // required this.homeNewBlog
  }) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FutureBuilder(
          future: _homeController.fetchBolg(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      width: 349.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image:
                                NetworkImage("${snapshot.data![index]!.image}"),
                            fit: BoxFit.cover,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 25.w),
                              child: CustomText(
                                  textText: "${snapshot.data![index]!.name}",
                                  color: Colors.white,
                                  fontSize: 20)),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 5.h),
                              // EdgeInsets.only(top: 5.h, left: 235.w, right: 25.w, bottom: 11),
                              child: CustomText(
                                  textText:
                                      "${snapshot.data![index]!.createdAt}"
                                          .substring(0, 10),
                                  color: const Color(0xffC1C1C1),
                                  fontSize: 16)),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
