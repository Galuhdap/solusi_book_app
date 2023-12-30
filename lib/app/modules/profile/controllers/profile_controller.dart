import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController verifEmail = TextEditingController();
  

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
    verifEmail = TextEditingController();
   
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.dispose();
    email.dispose();
    verifEmail.dispose();

  }

 
}
