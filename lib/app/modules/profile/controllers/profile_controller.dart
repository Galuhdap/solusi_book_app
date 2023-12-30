import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/user_model.dart';
import '../../../data/service/api_service.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController verifEmail = TextEditingController();

  final ApiService _apiService = Get.put(ApiService());
  final storage = GetStorage();

  var userModel = UserModel().obs;

  RxString responseData = ''.obs;

  Future<void> logout() async {
    try {
      await _apiService.dio.delete("/api/user/logout");
      storage.remove('key');
      Get.offAllNamed(Routes.LOGIN);
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> fetchUser() async {
    try {
      final response = await _apiService.dio.get("/api/user");
      userModel.value = UserModel.fromJson(response.data);
      print(response.data);
      name.text = userModel.value.name ?? '';
      email.text = userModel.value.email ?? '';
      verifEmail.text = userModel.value.name ?? '';
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUser();
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
