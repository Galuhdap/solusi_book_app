import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyBookController extends GetxController {
  //TODO: Implement MyBookController

  late TextEditingController isbn = TextEditingController();
  late TextEditingController title = TextEditingController();
  late TextEditingController subtitle = TextEditingController();
  late TextEditingController published = TextEditingController();
  late TextEditingController publisher = TextEditingController();
  late TextEditingController page = TextEditingController();
  late TextEditingController description = TextEditingController();
  late TextEditingController website = TextEditingController();

  Rxn<DateTime> date = Rxn<DateTime>();

  void calender(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      published.text = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(picked);
      date.value = picked;
    }
  }

  @override
  void onInit() {
    super.onInit();
    isbn = TextEditingController();
    title = TextEditingController();
    subtitle = TextEditingController();
    published = TextEditingController();
    publisher = TextEditingController();
    page = TextEditingController();
    description = TextEditingController();
    website = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    isbn.dispose();
    title.dispose();
    subtitle.dispose();
    published.dispose();
    publisher.dispose();
    page.dispose();
    description.dispose();
    website.dispose();
  }
}
