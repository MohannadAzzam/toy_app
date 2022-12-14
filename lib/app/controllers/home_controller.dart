import 'package:get/get.dart';

class LoginController extends GetxController{

  bool? isChecked  = true ;

   isClicked(newVal){
     isChecked = newVal;
     update();
   }


}