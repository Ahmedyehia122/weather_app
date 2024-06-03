class WeatherModel {
  final String cityName;
  final String? image;
  final String date;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.image,
    required this.date,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJson(josn) {
    return WeatherModel(
        cityName: josn['location']['name'],
        image: josn['forecast']['forecastday'][0]['day']['condition']['icon'],
        date: josn['forecast']['forecastday'][0]['date'],
        currentTemp: josn['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: josn['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: josn['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: josn['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
