import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/data_source/blog_data_list.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/blog_page/widgets/custom_blog_card.dart';
import 'package:toy_app/my_icons_icons.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

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
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: blogDataList.length,
            itemBuilder: (context, index) {
              return CustomBlogCard(
                blogData: blogDataList[index],
                // onTap: ()=>        Get.to(() => BlogDetailsPage(blogData: blogData));
                // onTap: () {
                //   print("======================${blogDataList.first}");
                //   var index1 = blogDataList.forEach((element) {
                //     Get.to(() => BlogDetailsPage(
                //           blogData: BlogData(element.id,
                //               blogImage: element.blogImage,
                //               blogName: element.blogName,
                //               blogDate: element.blogDate),
                //         ));
                //     return print(element.id);
                //   });
                //   // print("$index1");
                // },
              );
            }),
      ),
    );
  }
}
