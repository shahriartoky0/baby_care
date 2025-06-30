import 'package:get/get.dart';

class ButtonController extends GetxController {
  RxInt selectedIndex = 0.obs;

  // Function to update the selected index
  Future<void> updateSelectedIndex(int index) async {
    selectedIndex.value = index;
  }
}
