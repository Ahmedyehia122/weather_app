import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constant/Strings.dart';
import 'package:weather_app/core/constant/styles.dart';
import 'package:weather_app/cubits/get_wheather/get_wheather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/noweather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWheatherCubit, GetWheatherState>(
          builder: (context, state) {
            if (state is WheatherInitialState) {
              return const NoWeatherBody();
            } else if (state is WheatherLoadedState) {
              return WeatherInfoBody();
            } else if (state is WheatherFailedState) {
              return Center(
                  child: Text(
                state.errMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ));
            } else {
              return const Center(child: Text(Strings.customErrMessage));
            }
          },
        ));
  }
}
