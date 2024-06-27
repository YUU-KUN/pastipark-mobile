import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pastipark_mobile/app/routes/app_pages.dart';
import 'package:pastipark_mobile/app/services/auth_service.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  final user = {}.obs;
  final token = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
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

      box.write('token', login['data']['access_token']);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to login');
    } finally {
      isLoading(false);
    }
  }
}
