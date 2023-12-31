import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widget/fieldData_widget.dart';
import '../controllers/my_book_controller.dart';

class EditBookView extends GetView {
  const EditBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MyBookController bookController = Get.put(MyBookController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Book',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Color(0xff171b36),
      ),
      body: Obx(() {
        final editBook = bookController.books.value;
        TextEditingController _isbn =
            TextEditingController(text: editBook.isbn);
        TextEditingController _title =
            TextEditingController(text: editBook.title);
        TextEditingController _subtitle =
            TextEditingController(text: editBook.subtitle);
        TextEditingController _author =
            TextEditingController(text: editBook.author);
        TextEditingController _published = TextEditingController(
          text: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
              .format(DateTime.parse(editBook.published.toString())),
        );
        TextEditingController _publisher =
            TextEditingController(text: editBook.publisher);
        TextEditingController _page =
            TextEditingController(text: editBook.pages.toString());
        TextEditingController _description =
            TextEditingController(text: editBook.description);
        TextEditingController _website =
            TextEditingController(text: editBook.website);

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: Column(
              children: [
                FieldAddDataWidget(
                  title: "Nomor ISBN",
                  textController: _isbn,
                  typeInput: TextInputType.phone,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Title",
                  textController: _title,
                  typeInput: TextInputType.text,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Subtitle",
                  textController: _subtitle,
                  typeInput: TextInputType.text,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Author",
                  textController: _author,
                  typeInput: TextInputType.text,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Published",
                  textController: _published,
                  sufixIcon: Icons.calendar_today,
                  function: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: editBook.published ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (picked != null) {
                      _published.text =
                          DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                              .format(picked);
                      editBook.published = picked;
                    }
                  },
                  typeInput: TextInputType.text,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Publisher",
                  textController: _publisher,
                  typeInput: TextInputType.text,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Page",
                  textController: _page,
                  typeInput: TextInputType.phone,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Website",
                  textController: _website,
                  typeInput: TextInputType.url,
                  contentPadding: EdgeInsets.only(left: 13),
                ),
                FieldAddDataWidget(
                  title: "Description",
                  textController: _description,
                  typeInput: TextInputType.multiline,
                  maxLine: 4,
                  contentPadding: EdgeInsets.only(left: 13, top: 13),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      await bookController.editBook(
                        book_id: editBook.id.toString(),
                        isbn: _isbn.text,
                        title: _title.text,
                        subtitle: _subtitle.text,
                        author: _author.text,
                        published: editBook.published.toString(),
                        publisher: _publisher.text,
                        page: _page.text,
                        description: _description.text,
                        website: _website.text,
                      );
                      Get.back();
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
                        'EDIT BOOK',
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
        );
      }),
    );
  }
}
