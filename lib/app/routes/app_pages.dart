import 'package:get/get.dart';

import 'package:presence_app/app/modules/home/bindings/home_binding.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';
import 'package:presence_app/app/modules/login/bindings/login_binding.dart';
import 'package:presence_app/app/modules/login/views/login_view.dart';
import 'package:presence_app/app/modules/new_class/bindings/new_class_binding.dart';
import 'package:presence_app/app/modules/new_class/views/new_class_view.dart';
import 'package:presence_app/app/modules/presence/bindings/presence_binding.dart';
import 'package:presence_app/app/modules/presence/views/presence_view.dart';
import 'package:presence_app/app/modules/register/bindings/register_binding.dart';
import 'package:presence_app/app/modules/register/views/register_view.dart';
import 'package:presence_app/app/modules/teacher/bindings/teacher_binding.dart';
import 'package:presence_app/app/modules/teacher/views/detail_schedule.dart';
import 'package:presence_app/app/modules/teacher/views/teacher_view.dart';
import 'package:presence_app/app/utils/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.NEW_CLASS,
      page: () => NewClassView(),
      binding: NewClassBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER,
      page: () => TeacherView(),
      binding: TeacherBinding(),
    ),
    GetPage(
      name: _Paths.PRESENCE,
      page: () => PresenceView(),
      binding: PresenceBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SCHEDULE,
      page: () => DetailSchedule(),
    ),
  ];
}
