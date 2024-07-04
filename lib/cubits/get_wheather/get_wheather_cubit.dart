import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/constant/Strings.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'get_wheather_state.dart';

class GetWheatherCubit extends Cubit<GetWheatherState> {
  GetWheatherCubit() : super(WheatherInitialState());
  WeatherModel? weatherModel;
  getWheather({required String cityName}) async {
    emit(WheatherLoadingState());

    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WheatherLoadedState());
    } catch (e) {
      emit(WheatherFailedState(errMessage: Strings.customErrMessage));
    }
  }
}
