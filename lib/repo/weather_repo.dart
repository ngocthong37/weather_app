import 'dart:convert';

import 'package:get/get.dart';
import 'package:weather_app/api/api_client.dart';
import 'package:weather_app/constant/app_contant.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  ApiClient apiClient;
  WeatherRepo({
    required this.apiClient,
  });

  Future<Response> getWeatherData(String city) async {
    return await apiClient
        .getData("/data/2.5/weather?q=$city&appid=${AppConstant.api}");
  }

  Future<Response> getCurrentWeatherData(String lat, String lon) async {
    return await apiClient.getData(
        "/data/2.5/weather?lat=$lat&lon=$lon&appid=${AppConstant.api}");
  }

  Future<List<String>> searchCities({required query}) async {
    const limit = 3;
    final url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$query&limit=$limit&appid=${AppConstant.api}';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<String>((json) {
      final city = json['name'];
      final country = json['country'];
      return '$city, $country';
    }).toList();
  }
}
