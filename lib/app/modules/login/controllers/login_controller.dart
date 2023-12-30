import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    password.dispose();
  }
}
