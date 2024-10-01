import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/features/model/weather_model.dart';

import '../../core/network_service/web_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WebService weatherService;
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  WeatherModel? weatherModel;

  Future<void> getWeather (String cityName)async{
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.fetchWeather(cityName);
      emit(WeatherLoaded(weatherModel!, cityName));
    }on DioError catch (dioError){
      emit(WeatherFailure("Network issue: ${dioError.message}"));
    }catch(error){
      emit(WeatherFailure("An unexpected error occurred: $error"));
    }
  }
}
