import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_button.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import '../../../controllers/home_controller.dart';

class CustomTicketBookingCard extends StatelessWidget {

  CustomTicketBookingCard({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _homeController.fetchCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    width: 317.7.w,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image:
                              NetworkImage("${snapshot.data![index]!.image}"),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.only(
                              top: 175.h, right: 20.w, left: 20.w),

                          child: CustomText(
                              textText: "${snapshot.data![index]!.name}",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Container(
                            width: Get.width,
                            margin: EdgeInsets.only(
                                right: 20.w, top: 5.h, bottom: 5.h, left: 20.w),
                            child: CustomText(
                                textText:
                                    "${snapshot.data![index]!.shortDetails}",
                                color: Colors.white,
                                fontSize: 18)),
                        Expanded(
                          child: ListView(
                            children: [
                              Container(
                                  width: Get.width,
                                  margin:
                                      EdgeInsets.only(right: 20.w, left: 20.w),
                                  child: CustomText(
                                      textText:
                                          "${snapshot.data![index]!.details}",
                                      color: const Color(0xffC1C1C1),
                                      fontSize: 14))
                            ],
                          ),
                        ),
                        CustomButton(
                            onPressed: () {},
                            bottomMargin: 20,
                            topMargin: 20,
                            height: 60,
                            width: 220,
                            text: "BookTickets",
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
        });
  }
}
