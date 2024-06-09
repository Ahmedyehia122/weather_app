import 'package:flutter/material.dart';
import 'package:weather_app/core/constant/styles.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles();
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There is no weather...',
              style: styles.fontsize30,
            ),
            Text(
              'Searching now...',
              style: styles.fontsize30,
            ),
          ],
        ),
      ),
    );
  }
}
