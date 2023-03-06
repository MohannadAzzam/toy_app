import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/blog_page/widgets/custom_blog_card.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);
  // final BlogController _blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            textText: "blog", color: Colors.white, fontSize: 20),
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
      CustomBlogCard()
    );
  }
}
