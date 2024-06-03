import 'package:flutter/material.dart';
import 'package:weather_app/core/images_path.dart';
import 'package:weather_app/core/styles.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles();
    ImagesPath imagesPath = ImagesPath();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cairo', style: styles.fontsize30),
          const SizedBox(
            height: 10,
          ),
          const Text('updated at 23:12'),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagesPath.sunnyWeather, height: 60),
              const Text(
                '30',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Column(
                children: [
                  Text(
                    'maxtemp 30',
                  ),
                  Text('mintemp 22'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text('Light Rain', style: styles.fontsize30)
        ],
      ),
    );
  }
}
