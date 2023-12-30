import 'package:get/get.dart';

import '../controllers/my_book_controller.dart';

class MyBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBookController>(
      () => MyBookController(),
    );
  }
}
