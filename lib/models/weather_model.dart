class WeatherModel {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Hourly> hourly;
  List<Daily> daily;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily
    });

  WeatherModel.fromJson(Map<String, dynamic> json) :
    lat = json['lat'],
    lon = json['lon'],
    timezone = json['timezone'],
    timezoneOffset = json['timezone_offset'],
    current = Current.fromJson(json['current']),
    hourly = (json['hourly'] as List).map((e) => Hourly.fromJson(e)).toList(),
    daily = (json['daily'] as List).map((e) => Daily.fromJson(e)).toList();
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    data['current'] = this.current;
    data['hourly'] = this.hourly;  
    data['daily'] = this.daily;
    
    return data;
  }
}





class Current {
  double temp;
  int humidity;
  int clouds;
  double windSpeed;
  double uvIndex; 
  double feelsLike;
  List<Weather> weather;


  Current({
    required this.temp,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
    required this.uvIndex,
    required this.feelsLike,
    required this.weather,
  });

  Current.fromJson(Map<String, dynamic> json) :
    temp = json['temp'],
    humidity = json['humidity'],
    clouds = json['clouds'],
    windSpeed = json['wind_speed'],
    uvIndex = (json['uvi'] as num).toDouble(),
    feelsLike = json['feels_like'],
    weather = (json['weather'] as List).map((e) => Weather.fromJson(e)).toList();
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['clouds'] = this.clouds;
    data['wind_speed'] = this.windSpeed; 
    data['uvi'] = this.uvIndex;
    data['feels_like'] = this.feelsLike;
    data['weather'] = this.weather; 
    
    return data;
  }
}






class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({required this.id, required this.main, required this.description, required this.icon});

  Weather.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    main = json['main'],
    description = json['description'],
    icon = json['icon'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}






class Hourly {
  int dt;
  double temp;
  List<Weather> weather;
  

  Hourly({
    required this.dt,
    required this.temp,
    required this.weather,
  });



  Hourly.fromJson(Map<String, dynamic> json) :
    dt = json['dt'],
    temp = json['temp'],
    weather = (json['weather'] as List).map((e) => Weather.fromJson(e)).toList();



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['temp'] = this.temp;
    data['weather'] = this.weather;    
    
    return data;
  }

}






class Daily {
  int dt;
  Temp temp;
  List<Weather> weather;

  Daily({
      required this.dt,
      required this.temp,
      required this.weather,
      });

  Daily.fromJson(Map<String, dynamic> json) :
    dt = json['dt'],
    temp = Temp.fromJson(json['temp']),
    weather = (json['weather'] as List).map((e) => Weather.fromJson(e)).toList();

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['temp'] = this.temp;    
    data['weather'] = this.weather;

    return data;
  }

}





class Temp {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temp({required this.day, required this.min, required this.max, required this.night, required this.eve, required this.morn});

  Temp.fromJson(Map<String, dynamic> json) :
    day = json['day'],
    min = json['min'],
    max = json['max'],
    night = json['night'],
    eve = json['eve'],
    morn = json['morn'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}




class FeelsLike {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLike({required this.day, required this.night, required this.eve, required this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) :
    day = json['day'],
    night = json['night'],
    eve = json['eve'],
    morn = json['morn'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;

    return data;
  }
  
}

