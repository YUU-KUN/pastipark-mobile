import 'package:get/get.dart';
import 'package:pastipark_mobile/app/data/middleware/auth_middleware.dart';

import 'package:pastipark_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:pastipark_mobile/app/modules/home/views/home_view.dart';
import 'package:pastipark_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:pastipark_mobile/app/modules/login/views/login_view.dart';
import 'package:pastipark_mobile/app/modules/register/bindings/register_binding.dart';
import 'package:pastipark_mobile/app/modules/register/views/register_view.dart';
import 'package:pastipark_mobile/app/modules/report/bindings/report_binding.dart';
import 'package:pastipark_mobile/app/modules/report/views/report_view.dart';
import 'package:pastipark_mobile/app/modules/report_create/bindings/report_create_binding.dart';
import 'package:pastipark_mobile/app/modules/report_create/views/report_create_view.dart';
import 'package:pastipark_mobile/app/modules/report_create_confirmation/bindings/report_create_confirmation_binding.dart';
import 'package:pastipark_mobile/app/modules/report_create_confirmation/views/report_create_confirmation_view.dart';
import 'package:pastipark_mobile/app/modules/scan_evidence/bindings/scan_evidence_binding.dart';
import 'package:pastipark_mobile/app/modules/scan_evidence/views/scan_evidence_view.dart';
import 'package:pastipark_mobile/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:pastipark_mobile/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REPORT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.REPORT_CREATE,
      page: () => ReportCreateView(),
      binding: ReportCreateBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.SCAN_EVIDENCE,
      page: () => ScanEvidenceView(),
      binding: ScanEvidenceBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.REPORT_CREATE_CONFIRMATION,
      page: () => ReportCreateConfirmationView(),
      binding: ReportCreateConfirmationBinding(),
    ),
  ];
}
