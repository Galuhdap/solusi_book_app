import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../widget/listBook_widget.dart';

import '../controllers/my_book_controller.dart';
import 'add_book_view.dart';
import 'edit_book_view.dart';

class MyBookView extends GetView<MyBookController> {
  const MyBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final DetailBookController detailBook = Get.put(DetailBookController());
    final MyBookController bookController = Get.put(MyBookController());
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            'My Book',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xff171b36),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Get.to(AddBookView());
              },
              icon: Icon(
                Icons.add_circle_outline_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<MyBookController>(
        builder: (controller) {
          return controller.items.isEmpty
              ? Center(
                  child: Text('Data Kosong'),
                )
              : Container(
                  height: size.height * 0.8,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 25,
                    ),
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, index) {
                      var data = controller.items[index];
                      return ListBookWidget(
                        title: data.title,
                        author: data.author,
                        view: "Edit",
                        date: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                            .format(DateTime.parse(data.published.toString())),
                        function: () {
                          controller.book(data);
                          Get.to(EditBookView());
                        },
                        color: Color(0xff171B36),
                        contWidget: InkWell(
                          onTap: () {
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Delete Data",
                              desc: "Are you sure delete data?",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "CENCEL",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "DELETE",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    await controller.deleteBook(
                                        book_id: data.id.toString());
                                    Get.back();
                                  },
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(116, 116, 191, 1.0),
                                    Color.fromRGBO(52, 138, 199, 1.0)
                                  ]),
                                )
                              ],
                            ).show();
                          },
                          child: Container(
                            width: size.width / 10,
                            height: size.height / 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
