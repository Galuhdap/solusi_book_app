import 'package:get/get.dart';

import '../modules/detail_book/bindings/detail_book_binding.dart';
import '../modules/detail_book/views/detail_book_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_book/bindings/my_book_binding.dart';
import '../modules/my_book/views/my_book_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/spalsh_screen/bindings/spalsh_screen_binding.dart';
import '../modules/spalsh_screen/views/spalsh_screen_view.dart';
import '../widget/bottomNavigation_widget.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPALSH_SCREEN,
      page: () => const SpalshScreenView(),
      binding: SpalshScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BOOK,
      page: () => const DetailBookView(),
      binding: DetailBookBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => const BottomNavigationView(),
    ),
    GetPage(
      name: _Paths.MY_BOOK,
      page: () => const MyBookView(),
      binding: MyBookBinding(),
    ),
  ];
}
