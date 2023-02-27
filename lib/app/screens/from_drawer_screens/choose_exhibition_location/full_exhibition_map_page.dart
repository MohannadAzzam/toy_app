import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/screens/from_drawer_screens/choose_exhibition_location/chosoe_exhibition_location_page.dart';
import 'package:toy_app/my_icons_icons.dart';

class FullExhibitionMapPage extends StatelessWidget {
  const FullExhibitionMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                const Image(
                  image: AssetImage('assets/images/full_exhibition_map.png'),
                  fit: BoxFit.cover,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>const ChooseExhibitionLocationPage());
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: const Icon(
                        MyIcons.exit,
                        color: Colors.white,
                      )),
                )
                // IconButton(onPressed: (){
                //   Get.offAll(()=>ChooseExhibitionLocationPage());
                // }, icon: Icon(MyIcons.exit),color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
