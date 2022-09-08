import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/repo/weather_repo.dart';

class WeatherController extends GetxController implements GetxService {
  final WeatherRepo weatherRepo;
  WeatherController({
    required this.weatherRepo,
  });

  CurrentWeather? _currentWeather;
  CurrentWeather? get currentWeather => _currentWeather;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late String lat, lon;

  Future getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude.toString();
    lon = position.longitude.toString();
  }

  Future<void> getCurrentWeatherData() async {
    _isLoading = true;
    await getLocation();
    Response response = await weatherRepo.getCurrentWeatherData(lat, lon);
    if (response.statusCode == 200) {
      update();
      _currentWeather = CurrentWeather.fromJson(response.body);
    } else {
      print(response.statusText);
    }
    _isLoading = false;
    update();
  }

  Future<CurrentWeather> getWeatherData(String city) async {
    _isLoading = true;
    Response response = await weatherRepo.getWeatherData(city);
    if (response.statusCode == 200) {
      update();
      _currentWeather = CurrentWeather.fromJson(response.body);
    } else {
      print(response.statusText);
    }
    _isLoading = false;
    update();
    return _currentWeather!;
  }

  Future<List<String>> searchCities(String query) async {
    return weatherRepo.searchCities(query: query);
  }
}
