import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/api/api_client.dart';
import 'package:weather_app/constant/app_contant.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/repo/weather_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.baseUrl));

  // repo
  Get.lazyPut(() => WeatherRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(() => WeatherController(weatherRepo: Get.find()));

  if (await Permission.location.serviceStatus.isEnabled) {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print("Chap nhan");
    } 
    else {
      Map<Permission, PermissionStatus> status = await [
        Permission.location,
      ].request();
      if (await Permission.location.isDenied) {
        print("Da tu choi");
        openAppSettings();
      }
    }
  }
  Get.find<WeatherController>().getCurrentWeatherData();

}
