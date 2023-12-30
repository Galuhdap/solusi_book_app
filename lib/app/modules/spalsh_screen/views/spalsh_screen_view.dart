import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/spalsh_screen_controller.dart';

class SpalshScreenView extends GetView<SpalshScreenController> {
  const SpalshScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171B36),
      body: Center(
        child: Image.asset(
          'assets/icons/icons.png',
          scale: 5,
        ),
      ),
    );
  }
}
