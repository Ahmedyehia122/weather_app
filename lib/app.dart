import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/functions/get_theme_color.dart';
import 'package:weather_app/cubits/get_wheather/get_wheather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWheatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWheatherCubit, GetWheatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWheatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
