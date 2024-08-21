import 'package:get/get.dart';

class AuthFieldController extends GetxController {
  var isObscure = true.obs;

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }
}
