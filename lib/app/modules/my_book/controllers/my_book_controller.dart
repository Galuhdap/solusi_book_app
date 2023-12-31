import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sol_book/app/routes/app_pages.dart';

import '../../../data/models/book_model.dart';
import '../../../data/service/api_service.dart';
import '../views/my_book_view.dart';

class MyBookController extends GetxController {
  //TODO: Implement MyBookController

  TextEditingController isbn = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController published = TextEditingController();
  TextEditingController publisher = TextEditingController();
  TextEditingController page = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController website = TextEditingController();

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Rxn<DateTime> date = Rxn<DateTime>();
  final ApiService _apiService = Get.put(ApiService());
  final storage = GetStorage();
  var bookModel = BookModel().obs;
  List<BookModel> items = [];

  final books = BookModel(
          id: 0,
          userId: 0,
          isbn: "",
          title: "",
          subtitle: "",
          author: "",
          published: DateTime.now(),
          publisher: "",
          pages: 0,
          description: "",
          website: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .obs;

  void book(BookModel bookModel) {
    books.value = bookModel;
  }

  void calender(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      published.text = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(picked);
      date.value = picked;
    }
  }

  Future<void> fetchData() async {
    final response = await _apiService.dio.get("/api/books");
    items = (response.data["data"] as List<dynamic>)
        .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
        .toList();
    update();
  }

  Future<void> refreshData() async {
    await fetchData();
  }

  Future postBook({
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String published,
    required String publisher,
    required String page,
    required String description,
    required String website,
  }) async {
    try {
      final datas = {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published,
        "publisher": publisher,
        "pages": page,
        "description": description,
        "website": website
      };
      await _apiService.dio.post("/api/books/add", data: datas);

      await fetchData();

      // Get.offAll(MyBookView());
      Get.back();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future editBook({
    required String book_id,
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String published,
    required String publisher,
    required String page,
    required String description,
    required String website,
  }) async {
    try {
      final datas = {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published,
        "publisher": publisher,
        "pages": page,
        "description": description,
        "website": website
      };
      await _apiService.dio.put("/api/books/${book_id}/edit", data: datas);
      await fetchData();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future deleteBook({
    required String book_id,
  }) async {
    try {
      await _apiService.dio.delete(
        "/api/books/$book_id",
      );
      await fetchData();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future getByBookId({
    required String book_id,
  }) async {
    try {
      await _apiService.dio.delete(
        "/api/books/:book_id",
      );
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // isbn.clear();
    // title.clear();
    // subtitle.clear();
    // published.clear();
    // publisher.clear();
    // page.clear();
    // description.clear();
    // website.clear();
    isbn.dispose();
    title.dispose();
    subtitle.dispose();
    published.dispose();
    publisher.dispose();
    page.dispose();
    description.dispose();
    website.dispose();
    super.onClose();
  }
}
