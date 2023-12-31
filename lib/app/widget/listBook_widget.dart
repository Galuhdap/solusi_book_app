import 'package:flutter/material.dart';

class ListBookWidget extends StatelessWidget {
  final String? title;
  final String? author;
  final String? date;
  final String? view;
  final Function()? function;
  final Widget? contWidget;
  final Color? color;
  const ListBookWidget({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    required this.view,
    required this.function,
    required this.color,
    this.contWidget,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0, 6),
              blurRadius: 10,
              spreadRadius: 4,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${title}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${author}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${date}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: function,
                    child: Container(
                      width: size.width / 5,
                      height: size.height / 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color,
                      ),
                      child: Center(
                        child: Text(
                          "${view}",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (contWidget != null) contWidget!,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
