import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/inputField_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  height: 20,
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
                  height: 20,
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
                      backgroundColor: Colors.blue,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
