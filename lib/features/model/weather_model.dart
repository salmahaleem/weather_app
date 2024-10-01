
class WeatherModel{
  DateTime date;
  double maxtemp;
  double mintemp;
  double temp;
  String weatherCondition;

  WeatherModel ({required this.date,required this.maxtemp,required this.mintemp,required this.temp,required this.weatherCondition});

  factory WeatherModel.fromJson(Map<String,dynamic>json){

    var jsonefromcastday  = json["forecast"]["forecastday"][0]["date"];
    return WeatherModel(
      date: DateTime.parse(json["current"][" last_updated "] ?? DateTime.now().toIso8601String()),
      weatherCondition: jsonefromcastday ["condition"]?["text"] ?? "Unknown",
      temp: jsonefromcastday ["avgtemp_c"] ?? 0.0,
      maxtemp: jsonefromcastday ["maxtemp_c"] ?? 0.0,
      mintemp: jsonefromcastday ["mintemp_c"] ?? 0.0,
    );
  }
}