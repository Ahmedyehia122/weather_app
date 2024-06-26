import 'package:dio/dio.dart';
import 'package:weather_app/core/constant/Strings.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '${Strings.baseUrl}/forecast.json?key=${Strings.apiKey}&q=$cityName&days=1');
      Map josnData = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(josnData);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? Strings.customErrMessage;
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(Strings.customErrMessage);
    }
  }
}
