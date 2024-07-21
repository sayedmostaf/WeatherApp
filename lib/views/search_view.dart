import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    final weatherCondition = weatherCubit.weatherModel?.weatherCondition;
    final borderColor = getThemeColor(weatherCondition);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // backgroundColor: Colors.blue,
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            cursorColor: borderColor,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              hintText: 'Enter city name',
              labelText: 'Search',
              labelStyle: TextStyle(color: borderColor),
              suffixIcon: Icon(
                Icons.search,
                color: borderColor,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2.0, // Optional: Adjust width for focused state
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
