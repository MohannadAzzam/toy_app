import 'package:flutter/material.dart';
import 'package:toy_app/app/data/models/tickets/event.dart';
import 'package:toy_app/app/screens/auth/login/widgets/custom_text.dart';

import '../../../../data/models/tickets/evetn_num.dart';

class CustomCardContent extends StatelessWidget {
  final EventNum eventNum;
  final Event event;

  const CustomCardContent(
      {Key? key, required this.eventNum, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            textText: "${eventNum.eventNum}",
            color: Colors.black,
            fontSize: 18),
        Expanded(
            child: CustomText(
                textText: "${event.event}", color: Colors.black, fontSize: 18)),
      ],
    );
  }
}
