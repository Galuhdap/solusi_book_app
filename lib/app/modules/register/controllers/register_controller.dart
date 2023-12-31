import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confPassword = TextEditingController();

  Dio dio = Dio();
  final storage = GetStorage();

  RxBool obscureText = false.obs;

  void togglePasswordVisibility() {
    obscureText.toggle();
  }

  void snackBar(String msg) {
    Get.snackbar(
      "SUUCES",
      msg,
      duration: Duration(seconds: 2),
    );
  }

  void snackBarError(String msg, BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: msg,
      buttons: [],
    ).show();
  }

  Future register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required BuildContext context,
  }) async {
    try {
      if (name != '' &&
          email != '' &&
          password != '' &&
          password_confirmation != '') {
        if (email.contains("@")) {
          final datas = {
            'name': name,
            'email': email,
            'password': password,
            'password_confirmation': password_confirmation
          };

          final response = await dio.post(
              'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
              data: datas);
          snackBar("Register Berhasil");
          Get.offAllNamed(Routes.LOGIN);
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
    name = TextEditingController(text: '');
    email = TextEditingController(text: '');
    password = TextEditingController(text: '');
    confPassword = TextEditingController(text: '');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
