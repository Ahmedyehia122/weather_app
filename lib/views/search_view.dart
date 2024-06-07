import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) async {
                  WeatherModel weatherModel = await WeatherService(Dio())
                      .getCurrentWeather(cityName: value);
                  Navigator.of(context).pop();
                  log(weatherModel.cityName);
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 32,
                    ),
                    hintText: 'Enter a city..',
                    label: Text('Search'),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
