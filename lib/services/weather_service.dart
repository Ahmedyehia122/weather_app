import 'package:dio/dio.dart';
import 'package:weather_app/core/consts.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '${Constans.baseUrl}/forecast.json?key=${Constans.apiKey}&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? Constans.customErrMessage;
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(Constans.customErrMessage);
    }
  }
}
