import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/models/home/bolg_data.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';
import 'package:toy_app/my_icons_icons.dart';

class BlogDetailsPage extends StatelessWidget {
  final BlogData blogData;


  const BlogDetailsPage({Key? key, required this.blogData}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    String s = "هذا النص هو مثال لنص يمكن أن"
        " يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو"
        " العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\nإذا كنت تحتاج إلى عدد أكبر"
        " من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما"
        " ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج"
        " العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.\nومن هنا وجب على المصمم"
        " أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر"
        " على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم"
        " فيظهر بشكل لا يليق.\nهذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو"
        " وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.";

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const CustomText(
                textText: "التفاصيل", color: Colors.white, fontSize: 20),
            elevation: 0,
            backgroundColor: const Color(0xff6D2B70),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(MyIcons.ionic_ios_arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(blogData.blogImage)),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          textText: "${blogData.blogName}",
                          color: Colors.black,
                          fontSize: 18),
                      CustomText(
                          textText: "${blogData.blogDate}",
                          color: const Color(0xff949494),
                          fontSize: 16),
                      CustomText(textText: s, color: Colors.black, fontSize: 14)
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
