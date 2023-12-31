import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/listBook_widget.dart';
import '../../detail_book/controllers/detail_book_controller.dart';
import '../../my_book/controllers/my_book_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailBookController detailBook = Get.put(DetailBookController());
    final MyBookController productListController = Get.put(MyBookController());

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    height: size.height / 4,
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
                    child: Center(
                      child: Text(
                        "WELOCME HISTORY MY BOOK",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 30),
            child: Text(
              "Popular books",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: GetBuilder<MyBookController>(
              builder: (controller) {
                return controller.items.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Text(
                              "Waiting data ...",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                      )
                    : Container(
                        height: size.width / 1,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            top: 1,
                            left: 25,
                            right: 25,
                          ),
                          itemCount: controller.items.length,
                          itemBuilder: (BuildContext context, index) {
                            var data = controller.items[index];
                            return ListBookWidget(
                              title: data.title,
                              author: data.author,
                              view: "View Detail",
                              date: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                  .format(DateTime.parse(
                                      data.published.toString())),
                              function: () {
                                detailBook.book(data);
                                Get.toNamed(Routes.DETAIL_BOOK);
                              },
                              color: Color(0xffde7773),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
