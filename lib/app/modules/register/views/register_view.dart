import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/inputField_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/humanbag.png',
                  scale: 9,
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextFieldWidget(
                  textContoroller: controller.name,
                  hintext: 'Masukan Nama',
                  icons: Icons.account_circle_outlined,
                ),
                TextFieldWidget(
                  textContoroller: controller.email,
                  hintext: 'Masukan Email',
                  icons: Icons.email_outlined,
                ),
                Obx(
                  () => TextFieldWidget(
                    obscureText: controller.obscureText.value,
                    textContoroller: controller.password,
                    hintext: 'Masukan Password',
                    icons: Icons.lock_outline_rounded,
                    sufix: GestureDetector(
                      onTap: () {
                        controller.togglePasswordVisibility();
                      },
                      child: Icon(
                        controller.obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => TextFieldWidget(
                    obscureText: controller.obscureText.value,
                    textContoroller: controller.confPassword,
                    hintext: 'Masukan Password Confirmation',
                    icons: Icons.lock_outline_rounded,
                    sufix: GestureDetector(
                      onTap: () {
                        controller.togglePasswordVisibility();
                      },
                      child: Icon(
                        controller.obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.register(
                        name: controller.name.text,
                        email: controller.email.text,
                        password: controller.password.text,
                        password_confirmation: controller.confPassword.text,
                        context: context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: Color(0xff171b36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(0, 50)),
                  child: Center(
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    width: size.height * 0.1,
                    height: size.width * 0.1,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
