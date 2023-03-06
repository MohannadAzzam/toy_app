import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/sponsors_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/app/screens/from_drawer_screens/sponsors_page/widgets/sponsors_custom_icon_with_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class SponsorsPage extends StatelessWidget {
  SponsorsPage({Key? key}) : super(key: key);

  final SponsorsController _sponsorsController = Get.put(SponsorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            textText: "exhibitors", color: Colors.white, fontSize: 18),
        elevation: 0.r,
        backgroundColor: const Color(0xff6D2B70),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder(
          future: _sponsorsController.fetchSponsors(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3.r,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                      child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // child:
                      Stack(
                        textDirection: TextDirection.ltr,
                        children: [
                          Image(
                            image: NetworkImage(
                                "${snapshot.data![index].image}"),
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 5.h, left: 5.w, right: 5.w),
                            margin:
                                EdgeInsets.only(top: 3.h, left: 3.w),
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(15))
                                // borderRadius:
                                ),
                            child: Column(
                              children: [
                                const CustomText(
                                    textText: 'المكان',
                                    color: Colors.black,
                                    fontSize: 8),
                                CustomText(
                                  textText: "${snapshot.data!.length}",
                                  color: const Color(0xff911D74),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 15.h),
                              height: 50.h,
                              width: 50.h,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${snapshot.data![index].avatar}"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                          textText: "${snapshot.data![index].name}",
                          color: Colors.black,
                          fontSize: 14),

                      Column(
                        children: [
                          SponsorsCustomIconWithText(
                              icon: MyIcons.phone,
                              text: "${snapshot.data![index].phone}",
                              fontSize: 10),
                          SponsorsCustomIconWithText(
                              icon: MyIcons.message,
                              text: "${snapshot.data![index].email}",
                              fontSize: 10),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            // height: 70,
                            margin:
                                EdgeInsets.only(left: 5.w, right: 5.w),
                            child: CustomText(
                              textText:
                                  "${snapshot.data![index].details}",
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              MyIcons.linkedin,
                              color: Color(0xff911D74),
                              size: 20,
                            ),
                            Icon(
                              MyIcons.twitter,
                              color: Color(0xff911D74),
                              size: 20,
                            ),
                            Icon(
                              MyIcons.instagram,
                              color: Color(0xff911D74),
                              size: 20,
                            ),
                            Icon(
                              MyIcons.facebook,
                              color: Color(0xff911D74),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                      ),
                    );
                  });
            }
            // else if (snapshot.data!.length == 0) {
            //   return Center(child: Text("THERE IS NO DATA TO SHOW"));
            // }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
