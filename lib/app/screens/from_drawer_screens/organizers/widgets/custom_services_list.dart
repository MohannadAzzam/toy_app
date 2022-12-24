import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_app/app/data/models/services.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

class CustomServicesList extends StatelessWidget {
  final Services services;

  const CustomServicesList({Key? key, required this.services})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              textText: services.services, color: Colors.black, fontSize: 16),
        ],
      ),
    );
  }
}
