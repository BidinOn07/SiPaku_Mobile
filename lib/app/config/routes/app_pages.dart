import 'package:get/get.dart';

import '../../daftarpenyakit/bindings/daftarpenyakit_binding.dart';
import '../../daftarpenyakit/views/daftarpenyakit_view.dart';
import '../../dashboard/bindings/dashboard_binding.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../deteksi/bindings/deteksi_binding.dart';
import '../../deteksi/views/deteksi_view.dart';
import '../../diagnosa/bindings/diagnosa_binding.dart';
import '../../diagnosa/views/diagnosa_view.dart';
import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';
import '../../profile/bindings/profile_binding.dart';
import '../../profile/ubah_profile/views/screens/ubah_akun_screen.dart';
import '../../profile/ubah_profile/views/screens/ubah_password_screen.dart';
import '../../profile/views/profile_view.dart';
import '../../sign_in/bindings/sign_in_binding.dart';
import '../../sign_in/views/sign_in_view.dart';
import '../../splash/bindings/splash_binding.dart';
import '../../splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: _Paths.DASHBOARD,
          page: () => DashboardScreen(),
          binding: DashboardBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfilView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.UBAH_PROFILE,
          page: () => const UbahAkunScreen(),
          binding: UbahPasswordBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.DIAGNOSA,
      page: () => const DiagnosaView(),
      binding: DiagnosaBinding(),
    ),
    GetPage(
      name: _Paths.DAFTARPENYAKIT,
      page: () => const DaftarpenyakitView(),
      binding: DaftarpenyakitBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.DETEKSI,
      page: () => const DeteksiView(),
      binding: DeteksiBinding(),
    ),
  ];
}
