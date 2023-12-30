import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiService extends GetxService {
  late Dio dio;
  final storage = GetStorage();

  @override
  void onInit() {
    dio = Dio();
    dio.options.baseUrl = 'https://book-crud-service-6dmqxfovfq-et.a.run.app';
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 5000);

    // Add your authorization logic here
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // For example, check if you have a valid access token
          final accessToken = storage.read('key');

          if (accessToken != null) {
            // Add the token to the headers
            options.headers["Authorization"] = "Bearer $accessToken";
          }

          return handler.next(options);
        },
      ),
    );

    super.onInit();
  }
}
