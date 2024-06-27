import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/services/auth_service.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  final user = {}.obs;
  final token = ''.obs;
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final passwordConfirmaton = ''.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setToken(String token) {
    this.token.value = token;
  }

  void setUser(Map<String, dynamic> user) {
    this.user.value = user;
  }

  void login() async {
    try {
      isLoading(true);
      var login = await AuthService().login(email.value, password.value);
      isLoggedIn(true);
      setToken(login['data']['token']);
      setUser(login['data']['user']);

      box.write('token', login['data']['token']);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to login');
    } finally {
      isLoading(false);
    }
  }

  void register() async {
    try {
      isLoading(true);
      await AuthService().register(
        name.value,
        email.value,
        password.value,
        passwordConfirmaton.value,
      );
      isLoggedIn(true);

      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to register');
    } finally {
      isLoading(false);
    }
  }
}
