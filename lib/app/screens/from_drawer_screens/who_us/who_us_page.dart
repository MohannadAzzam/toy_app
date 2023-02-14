import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/controllers/aboutUs_controller.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class WhoUsPage extends StatelessWidget {
  const WhoUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AboutUsController aboutUsController = Get.find();

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
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
            textText: "aboutUs", color: Colors.white, fontSize: 18),
        elevation: 0.r,
        backgroundColor: const Color(0xff6D2B70),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios,size: 24,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/who_us_uper.png')),
            Container(
              height: 500,
              margin: EdgeInsets.only(
                  top: 5.h, right: 10.w, left: 10.w, bottom: 10.h),
              width: Get.width,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView(
                        children: [
                          CustomText(
                              textText: "${snapshot.data!.page.title}",
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          CustomText(
                              textText:
                                  "${snapshot.data!.page.description}",
                              color: Colors.black,
                              fontSize: 14),
                        ],
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("error occurred"),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: aboutUsController.fetchPage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
