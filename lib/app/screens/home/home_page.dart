import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toy_app/app/testPage.dart';
import 'package:toy_app/my_icons_icons.dart';

import '../../data/data_source/Home_top_card_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff6D2B70),
      endDrawer: const Drawer(),
      appBar: AppBar(
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(image: AssetImage('assets/images/home_page_up.png')),
          // ListView.separated(
          //     itemBuilder: (context, index) {
          //       return Card(Icons.abc, 'kjsfdal');
          //     },
          //     separatorBuilder: (context, i) => SizedBox(
          //           width: 12,
          //         ),
          //     itemCount: HomeTopCardList.length)
        ],
      ),
    );
  }
}

Widget CustomCard(IconData icon, String title) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding:
            EdgeInsets.only(top: 20.h, left: 39.w, right: 39.w, bottom: 16.h),
// width: 126.w,
        height: 160.h,
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xff911D74),
              child: Icon(
                icon,
                color: Colors.white,
// color: Color(0xff911D74),
                size: 48,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(fontSize: 18.sp),
                  color: const Color(0xff911D74)),
            )
          ],
        ),
      ),
    );
