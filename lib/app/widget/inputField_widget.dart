import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintext;
  final IconData? icons;
  final TextEditingController? textContoroller;

  TextFieldWidget({super.key, this.hintext, this.icons, this.textContoroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: textContoroller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icons,
            size: 30,
          ),
          prefixIconColor: Colors.black.withOpacity(0.6),
          hintText: hintext,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          contentPadding: EdgeInsets.only(left: 20),
        ),
        style: TextStyle(fontSize: 15),
        cursorColor: Colors.black.withOpacity(0.6),
      ),
    );
  }
}
