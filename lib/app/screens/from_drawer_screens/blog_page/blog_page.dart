import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/blog_page/widgets/custom_blog_card.dart';
import 'package:toy_app/my_icons_icons.dart';

class BlogPage extends StatelessWidget {
  BlogPage({Key? key}) : super(key: key);
  // final BlogController _blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
              textText: 'المدونة', color: Colors.white, fontSize: 20),
          elevation: 0,
          backgroundColor: const Color(0xff6D2B70),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(MyIcons.ionic_ios_arrow_back),
          ),
        ),
        body:
        CustomBlogCard()
        // FutureBuilder(
        //     future: _blogController.fetchBlog(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //             physics: const BouncingScrollPhysics(),
        //             itemCount: snapshot.data!.length,
        //             itemBuilder: (context, index) {
        //               return Container(
        //                 height: 225.h,
        //                 width: 400.w,
        //                 margin: EdgeInsets.only(
        //                     top: 10.h, left: 10.w, right: 10.w, bottom: 5.h),
        //                 decoration: BoxDecoration(
        //                   // color: Colors.transparent,
        //                   border: Border.all(color: Colors.transparent),
        //                   borderRadius: BorderRadius.circular(10),
        //                   image: DecorationImage(
        //                       image: NetworkImage(
        //                         snapshot.data![index].image,
        //                       ),
        //                       fit: BoxFit.cover),
        //                 ),
        //                 child: Container(
        //                   // color: Colors.blue,
        //                   alignment: Alignment.bottomRight,
        //                   margin: EdgeInsets.only(
        //                       left: 20.w, right: 20.w, bottom: 10.h),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.end,
        //                     children: [
        //                       CustomText(
        //                           textText: "${snapshot.data![index].name}",
        //                           color: Colors.white,
        //                           fontSize: 18),
        //                       CustomText(
        //                           textText: "${snapshot.data![index].createdAt}"
        //                               .substring(0, 10),
        //                           color: Color(0xffC1C1C1),
        //                           fontSize: 16)
        //                     ],
        //                   ),
        //                 ),
        //               );
        //             });
        //       } else {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //     }),
      ),
    );
  }
}
