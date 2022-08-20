import 'package:flutter/material.dart';
import 'package:weather_flutter/src/constants/app_colors.dart';
import 'package:weather_flutter/src/features/view/city_search_box.dart';
import 'package:weather_flutter/src/features/view/current_weather.dart';
import 'package:weather_flutter/src/features/view/daily_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  SizedBox(height: 20,),
                  CitySearchBox(),
                  SizedBox(height: 20,),
                  CurrentWeather(),
                  SizedBox(height: 20,),
                  DailyWeather(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
