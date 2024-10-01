import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/ui/Search_page.dart';

import '../logic/weather_cubit.dart';

class HomePage extends StatelessWidget{

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Weather App"),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${state.cityName}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Update time: ${state.weatherModel.date.hour.toString()}:${state.weatherModel.date.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Temperature: ${state.weatherModel.temp}°C",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                );
              } else if (state is WeatherFailure) {
                return Center(
                  child: Text(
                    "Error: ${state.errorMsg}",
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                );
              }
              return const Center(
                child: Text(
                  "Please search for weather data.",
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          ),
        ),
    );
  }

}