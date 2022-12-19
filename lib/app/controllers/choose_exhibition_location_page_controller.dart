import 'package:get/get.dart';

class ChooseExhibitionLocationPageController extends GetxController {
  var selectedPlace = 1;
  var isSelected = true;

  changeSelectedPlace(var newPlace) {
    selectedPlace = newPlace;
    isSelected = !isSelected;
    // print(isSelected);
    // print(selectedPlace);
    update();
  }
}
