import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/controllers/categories_controller.dart';
import 'package:toy_app/app/data/data_source/helper_list.dart';
import 'package:toy_app/app/data/data_source/home_new_blog_list.dart';
import 'package:toy_app/app/data/models/home_response.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/home/widgets/custom_card.dart';
import 'package:toy_app/app/screens/home/widgets/custom_helper.dart';
import 'package:toy_app/app/screens/home/widgets/custom_new_blog_card.dart';
import 'package:toy_app/app/screens/home/widgets/home_custom_drawer.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../data/data_source/Home_top_card_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff6D2B70),
      endDrawer: const HomeCustomDrawer(),
      appBar: AppBar(
        // centerTitle: true,
        // title: Text('الصفحة الرئيسية',style: TextStyle(fontFamily: 'din-next-lt-w23'),),
        elevation: 0,
        backgroundColor: const Color(0xff6D2B70),
        leading: const Image(
            image: AssetImage('assets/images/notification_icon.png')),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(
                MyIcons.menu,
                size: 32,
              ),
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Stack(
                children: [
                  const Image(
                      image: AssetImage('assets/images/home_page_up.png')),
                  Container(
                    margin: EdgeInsets.only(top: 150.h),
                    height: 130.h,
                    width: Get.width,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCard(
                              homeTopCardItems: homeTopCardList[index]);
                        },
                        separatorBuilder: (context, i) => SizedBox(
                              width: 8.w,
                            ),
                        itemCount: homeTopCardList.length),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width,
                height: 400.h,
                child: FutureBuilder<List<Categore?>?>(
                    future: categoryController.fetchCategory(),
                    builder:
                        (context, AsyncSnapshot<List<Categore?>?> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return
                                Container(
                                margin: const EdgeInsets.all(5),
                                width: 317.7.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${snapshot.data![index]!.image}"),
                                      fit: BoxFit.cover,
                                    )),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 175.h, right: 20.w),
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                          textText:
                                              "${snapshot.data![index]!.name}",
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 20.w,top: 5.h,bottom: 5.h),
                                        alignment: Alignment.topRight,
                                        child: CustomText(
                                            textText:
                                            "${snapshot.data![index]!.shortDetails}",
                                            color: Colors.white,
                                            fontSize: 18)
                                        ),
                                    Expanded(
                                      child: ListView(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 20.w),
                                              alignment: Alignment.topRight,
                                              child: CustomText(
                                                  textText:
                                                      "${snapshot.data![index]!.details}",
                                                  color: Color(0xffC1C1C1),
                                                  fontSize: 14.sp))
                                        ],
                                      ),
                                    ),
                                    CustomButton(
                                        onPressed: () {},
                                        bottomMargin: 20,
                                        topMargin: 20,
                                        height: 60,
                                        width: 220,
                                        text: "احجز تذاكر",
                                        rightMargin: 60,
                                        leftMargin: 60)
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
              ),
              Container(
                  margin: EdgeInsets.only(top: 15.h, right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'المساعدة',
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            color: const Color(0xff911D74), fontSize: 20.sp),
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'سيسعد فريق المبيعات لدينا بالإجابة على أي\nأسئلة قد تكون لديك ومساعدتك في التسجيل',
                    style: GoogleFonts.cairo(
                      textStyle:
                          TextStyle(color: Colors.black, fontSize: 16.sp),
                    ),
                  )),
              SizedBox(
                // margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10),
                height: 234.h,
                width: Get.width,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeCustomHelper(customHelper: helperList[index]);
                    },
                    separatorBuilder: (context, i) => SizedBox(
                          width: 8.w,
                        ),
                    itemCount: helperList.length),
              ),
              Container(
                  margin: EdgeInsets.only(right: 12.w, left: 12.w),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'جديد المدونة',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          color: const Color(0xff911D74),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 234.h,
                width: Get.width,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomNewBlogCard(
                          homeNewBlog: homeNewBlogList[index]);
                    },
                    separatorBuilder: (context, i) => SizedBox(
                          width: 8.w,
                        ),
                    itemCount: homeNewBlogList.length),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
