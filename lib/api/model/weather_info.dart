class WeatherInfo {
  late final double temp;
  late final double tempMax;
  late final double tempMin;
  late final double sens;
  late final String iconString;

  WeatherInfo(this.temp, this.tempMax, this.tempMin, this.sens, this.iconString);

  WeatherInfo.fromObject(Map<String, dynamic> object) {
    temp = object['main']['temp'] - 272.15;
    tempMax = object['main']['temp_max'] - 272.15;
    tempMin = object['main']['temp_min'] - 272.15;
    sens = object['main']['feels_like'] - 272.15;
    iconString = object['weather'][0]['icon'];
  }
}
