import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/book_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/listBook_widget.dart';
import '../../detail_book/controllers/detail_book_controller.dart';
import '../controllers/my_book_controller.dart';

class MyBookView extends GetView<MyBookController> {
  const MyBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DetailBookController detailBook = Get.put(DetailBookController());
    Future<List<BookModel>> loadJson() async {
      var data = await rootBundle.loadString('assets/data/books.json');
      List<dynamic> jsonData = jsonDecode(data);
      return jsonData.map((item) => BookModel.fromJson(item)).toList();
    }

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
            child: Icon(
              Icons.add_circle_outline_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<BookModel>>(
        future: loadJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 600,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 25,
                  right: 25,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) {
                  var data = snapshot.data![index];
                  return ListBookWidget(
                    title: data.title,
                    author: data.author,
                    date: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                        .format(DateTime.parse(data.published.toString())),
                    // date: data.published.toString(),
                    function: () {
                      detailBook.book(data);
                      Get.toNamed(Routes.DETAIL_BOOK);
                    },
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
