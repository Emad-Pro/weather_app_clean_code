class ApiConstance {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const String apiKey = '9996a75beedd60245c08f8655f3a6482';
  static String urlWeather({required double long, required double late}) =>
      '${baseUrl}weather?lat=$late&lon=$long&appid=$apiKey';
  static String urlWeatherForCastFiveDay({required double long, required double late}) =>
      '${baseUrl}forecast?lat=$late&lon=$long&appid=$apiKey';
}
