import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '1be1e466dbec4c85966120552240306';
  final String customErrMessage =
      'oops there was an error, please try again later!';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? customErrMessage;
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(customErrMessage);
    }
  }
}
