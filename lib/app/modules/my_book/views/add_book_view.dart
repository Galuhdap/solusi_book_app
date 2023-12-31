import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/fieldData_widget.dart';
import '../controllers/my_book_controller.dart';

class AddBookView extends GetView {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyBookController bookController = Get.put(MyBookController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Book',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Color(0xff171b36),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Column(
            children: [
              FieldAddDataWidget(
                title: "Nomor ISBN",
                textController: bookController.isbn,
                typeInput: TextInputType.number,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Title",
                textController: bookController.title,
                typeInput: TextInputType.text,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Subtitle",
                textController: bookController.subtitle,
                typeInput: TextInputType.text,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Author",
                textController: bookController.author,
                typeInput: TextInputType.text,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Published",
                textController: bookController.published,
                sufixIcon: Icons.calendar_today,
                function: () async {
                  bookController.calender(context);
                },
                typeInput: TextInputType.text,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Publisher",
                textController: bookController.publisher,
                typeInput: TextInputType.text,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Page",
                textController: bookController.page,
                typeInput: TextInputType.phone,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Website",
                textController: bookController.website,
                typeInput: TextInputType.url,
                contentPadding: EdgeInsets.only(left: 13),
              ),
              FieldAddDataWidget(
                title: "Description",
                textController: bookController.description,
                typeInput: TextInputType.multiline,
                maxLine: 4,
                contentPadding: EdgeInsets.only(left: 13, top: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    await bookController.postBook(
                        isbn: bookController.isbn.text,
                        title: bookController.title.text,
                        subtitle: bookController.subtitle.text,
                        author: bookController.author.text,
                        published: bookController.date.toString(),
                        publisher: bookController.publisher.text,
                        page: bookController.page.text,
                        description: bookController.description.text,
                        website: bookController.website.text);
                    await bookController.fetchData();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: Color(0xff171b36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(0, 50)),
                  child: Center(
                    child: Text(
                      'ADD BOOK',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
