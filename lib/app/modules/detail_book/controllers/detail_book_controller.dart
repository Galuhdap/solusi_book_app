import 'package:get/get.dart';
import 'package:sol_book/app/data/models/book_model.dart';

class DetailBookController extends GetxController {
  //TODO: Implement DetailBookController

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

  @override
  void onInit() {
    super.onInit();
  }
}
