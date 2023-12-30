import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confPassword = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.dispose();
    email.dispose();
    password.dispose();
    confPassword.dispose();
  }
}
