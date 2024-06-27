import 'dart:io';

class ApiHelper {
  static final String baseUrl = Platform.environment.containsKey("DART_ENV")
      ? 'https://6789-cs-88dd52b8-7297-40d0-bc26-62bf0c9ff186.cs-asia-southeast1-ajrg.cloudshell.dev'
      : 'https://1117-103-194-172-70.ngrok-free.app';
  // : 'http://10.0.2.2:6789';

  static String getEndpoint(String endpoint) {
    return '$baseUrl/$endpoint';
  }
}
