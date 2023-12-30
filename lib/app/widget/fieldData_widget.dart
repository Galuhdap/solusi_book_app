import 'package:flutter/material.dart';

class FieldAddDataWidget extends StatelessWidget {
  final String? title;
  final TextEditingController? textController;
  final IconData? sufixIcon;
  final Function()? function;
  final TextInputType? typeInput;
  final int? maxLine;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;
  const FieldAddDataWidget(
      {super.key,
      required this.title,
      required this.textController,
      required this.typeInput,
      required this.contentPadding,
      this.sufixIcon,
      this.function,
      this.maxLine,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            enabled: enabled,
            controller: textController,
            keyboardType: TextInputType.multiline,
            maxLines: maxLine,
            decoration: InputDecoration(
              prefixIconColor: Colors.black.withOpacity(0.6),
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w300,
                fontSize: 13,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              contentPadding: contentPadding,
              suffixIcon: Icon(sufixIcon),
            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            cursorColor: Colors.black.withOpacity(0.6),
            onTap: function,
          ),
        ],
      ),
    );
  }
}
