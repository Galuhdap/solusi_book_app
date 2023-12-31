import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sol_book/app/routes/app_pages.dart';

import '../../../widget/inputField_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                  'assets/img/human.png',
                  scale: 9,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextFieldWidget(
                  textContoroller: controller.email,
                  hintext: 'Masukan Email',
                  icons: Icons.email_outlined,
                ),
                TextFieldWidget(
                  textContoroller: controller.password,
                  hintext: 'Masukan Password',
                  icons: Icons.lock_outline_rounded,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.login(
                      email: controller.email.text,
                      password: controller.password.text,
                      context: context,
                    );
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
                      'LOGIN',
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
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Container(
                    width: size.height * 0.1,
                    height: size.width * 0.1,
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
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
