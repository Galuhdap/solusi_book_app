// import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  Dio dio = Dio();
  final storage = GetStorage();

  void snackBarError(String msg, BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: msg,
      buttons: [],
    ).show();
  }

  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (email != '' && password != '') {
        if (email.contains("@")) {
          final datas = {
            'email': email,
            'password': password,
          };

          final response = await dio.post(
              'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login',
              data: datas);
          storage.write('key', response.data['token']);
          print(response.data['token']);
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
          // return response.data['token'];
        } else {
          snackBarError("Masukan email Valid", context);
        }
      } else {
        snackBarError("Semua data harus diisi", context);
      }
    } catch (e) {
      snackBarError("Error From Server", context);
    }
  }

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
