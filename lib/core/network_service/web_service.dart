import 'package:dio/dio.dart';
import '../../features/model/weather_model.dart';

class WebService{
  Dio _dio =Dio();

  Future<WeatherModel>fetchWeather(String cityName)async{
    try{
      final response = await _dio.get
        ('http://api.weatherapi.com/v1/forecast.json?key=8428f9fbcd3b413781f151337242709&q=$cityName&days=7&aqi=no&alerts=no');
         print("Response Date: ${response.data}");
         if(response.statusCode == 200){
            Map<String,dynamic> data = response.data;
            WeatherModel weatherModel = WeatherModel.fromJson(data);
            return weatherModel;
         }
         else{
           throw Exception(response.data["error"]["message"]);
         }
    }catch (error) {
      throw Exception("Failed to fetch weather: $error");
    }
  }
}