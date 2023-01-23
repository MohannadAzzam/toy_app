import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/home_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class HomeCustomHelper extends StatelessWidget {
  // final Helper customHelper;

   HomeCustomHelper({
    Key? key,
    // required this.customHelper,
  }) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return                 FutureBuilder(
        future: _homeController.fetchSupportTeams(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 3,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: 15.h,
                                  left: 40.w,
                                  right: 40.w),
                              child: CircleAvatar(
                                radius: 50.r,
                                backgroundImage: AssetImage(
                                    "${snapshot.data![index]!.image}"),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  top: 2.h,
                                  left: 40.w,
                                  right: 40.w),
                              child: CustomText(
                                  textText:
                                  "${snapshot.data![index]!.name}",
                                  color: Colors.black,
                                  fontSize: 18)),
                          Container(
                              margin: EdgeInsets.only(
                                top:
                                2.h, /*left: 40.w, right: 40.w*/
                              ),
                              child: CustomText(
                                  textText:
                                  "${snapshot.data![index]!.position}",
                                  color: const Color(0xff949494),
                                  fontSize: 16)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              const InkWell(
                                child: Icon(
                                  MyIcons.phone,
                                  size: 16,
                                  color: Color(0xff911D74),
                                ),
                              ),
                              SizedBox(
                                width: 70.w,
                              ),
                              const InkWell(
                                child: Icon(
                                  MyIcons.message,
                                  size: 16,
                                  color: Color(0xff911D74),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
