import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SpalshScreenController extends GetxController {
  //TODO: Implement SpalshScreenController
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    Future.delayed(
      Duration(seconds: 2),
      () async {
        if (storage.read('key') != '' && storage.read('key') != null) {
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      },
    );
  }
}
