import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/images_path.dart';
import 'package:weather_app/core/styles.dart';
import 'package:weather_app/cubits/get_wheather/get_wheather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWheatherCubit>(context).weatherModel;
    Styles styles = Styles();
    ImagesPath imagesPath = ImagesPath();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherModel.cityName, style: styles.fontsize30),
          const SizedBox(
            height: 10,
          ),
          Text('updated at ${weatherModel.date}'),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.asset(imagesPath.sunnyWeather, height: 60),
              CachedNetworkImage(imageUrl: 'https:' + weatherModel.image!),
              Text(
                '${weatherModel.currentTemp}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maxtemp ' + '${weatherModel.maxTemp.round()}',
                  ),
                  Text('Mintemp ' + '${weatherModel.minTemp.round()}'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(weatherModel.weatherCondition, style: styles.fontsize30)
        ],
      ),
    );
  }
}
