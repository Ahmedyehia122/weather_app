import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  Future<WeatherModel> getWeatherService({required String cityName}) async {
    Response response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json?key=1be1e466dbec4c85966120552240306&q=$cityName&days=1');
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
