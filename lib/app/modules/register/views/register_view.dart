import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/inputField_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                height: 20,
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
              TextFieldWidget(
                textContoroller: controller.password,
                hintext: 'Masukan Password',
                icons: Icons.lock_outline_rounded,
              ),
              TextFieldWidget(
                textContoroller: controller.confPassword,
                hintext: 'Masukan Password Confirmation',
                icons: Icons.lock_outline_rounded,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: Colors.blue,
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
            ],
          ),
        ),
      ),
    );
  }
}
