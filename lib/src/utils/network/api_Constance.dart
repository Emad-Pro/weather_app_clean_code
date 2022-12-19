class ApiConstance {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  static const String apiKey = '9996a75beedd60245c08f8655f3a6482';
  static String url({required double long, required double late}) =>
      '${baseUrl}lat=$late&lon=$long&appid=$apiKey';
}
