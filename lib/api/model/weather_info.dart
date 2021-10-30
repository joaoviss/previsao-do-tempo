class WeatherInfo {
  late final double temp;
  late final double tempMax;
  late final double tempMin;
  late final double sens;
  late final String desc;

  WeatherInfo(this.temp, this.tempMax, this.tempMin, this.sens, this.desc);

  WeatherInfo.fromObject(Map<String, dynamic> object) {
    temp = object['main']['temp'] - 272.15;
    tempMax = object['main']['tempMax'] - 272.15;
    tempMin = object['main']['tempMin'] - 272.15;
    sens = object['main']['sens'] - 272.15;
    desc = object['main']['description'];
  }
}
