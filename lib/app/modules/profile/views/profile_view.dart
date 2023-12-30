import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/fieldData_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            FieldAddDataWidget(
              title: "Nama",
              enabled: false,
              textController: profileController.name,
              typeInput: TextInputType.text,
              contentPadding: EdgeInsets.only(left: 13),
            ),
            FieldAddDataWidget(
              title: "Email",
              enabled: false,
              textController: profileController.email,
              typeInput: TextInputType.text,
              contentPadding: EdgeInsets.only(left: 13),
            ),
            FieldAddDataWidget(
              title: "Email Verified At",
              enabled: false,
              textController: profileController.email,
              typeInput: TextInputType.text,
              contentPadding: EdgeInsets.only(left: 13),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                await profileController.logout();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(0, 50)),
              child: Center(
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
