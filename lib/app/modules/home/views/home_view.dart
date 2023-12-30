import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sol_book/app/data/models/book_model.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/listBook_widget.dart';
import '../../detail_book/controllers/detail_book_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailBookController detailBook = Get.put(DetailBookController());
    Future<List<BookModel>> loadJson() async {
      var data = await rootBundle.loadString('assets/data/books.json');
      List<dynamic> jsonData = jsonDecode(data);
      return jsonData.map((item) => BookModel.fromJson(item)).toList();
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Easy Book",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 183,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(0, 6),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Text(
              "Popular books",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<BookModel>>(
            future: loadJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: 350,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: 1,
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
        ],
      ),
    );
  }
}
