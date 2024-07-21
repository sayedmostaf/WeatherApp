class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.temp,
      this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    final forecastDay =
        json['forecast']['forecastday'][0]['day'] as Map<String, dynamic>;

    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: (forecastDay['avgtemp_c'] as num).toDouble(),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      maxTemp: (forecastDay['maxtemp_c'] as num).toDouble(),
      minTemp: (forecastDay['mintemp_c'] as num).toDouble(),
      weatherCondition: forecastDay['condition']['text'] as String,
    );
  }
}
