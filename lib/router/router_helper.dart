import 'package:get/get.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/perrmission.dart';
import 'package:weather_app/screens/search_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String noPermision = '/no_permission';
  static const String searchWeather = '/search_weather';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: noPermision, page: () => NoPerrmission()),
    GetPage(name: searchWeather, page: () => SearchPlaceScreen())
  ];
}
