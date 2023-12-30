import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController verifEmail = TextEditingController();
  

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController(text: 'Galuh');
    email = TextEditingController(text: 'galuh@gmail.com');
    verifEmail = TextEditingController(text: '009933990');
   
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
