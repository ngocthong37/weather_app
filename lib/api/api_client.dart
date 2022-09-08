import 'package:get/get.dart';
import 'package:weather_app/constant/app_contant.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;
  ApiClient({
    required this.appBaseUrl,
  }) {
    token = AppConstant.token;
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
