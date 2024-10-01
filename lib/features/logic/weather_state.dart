part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  WeatherModel weatherModel;
  String cityName;
  WeatherLoaded(this.weatherModel,this.cityName);
}

final class WeatherFailure extends WeatherState {
  final String errorMsg;
  WeatherFailure(this.errorMsg);
}
