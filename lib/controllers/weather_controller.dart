import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:zigo/models/weather_model.dart';
import 'package:zigo/services/api/api_keys.dart';

class WeatherController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //getters
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  // GetConnect from getX
  final _getConnect = GetConnect();

  // WEATHER DATA
    late WeatherModel _weatherModel;
    WeatherModel get weatherModel => _weatherModel;

    List<Daily> _dailyWeatherList = [];
    List<Daily> get dailyWeatherList => _dailyWeatherList;

    List<Hourly> _hourlyWeatherList = [];
    List<Hourly> get hourlyWeatherList => _hourlyWeatherList;

    final currentWeatherDataList = [].obs;
    Current get currentWeatherData => currentWeatherDataList[0];


    // Current index
    final RxInt _currentIndex = 0.obs;



  @override
  void onInit() {
    if(_isLoading.isTrue){
      getLocation();
    }else{
      getCurrentIndex();
    }
    super.onInit();
  }


  // A function which gets user specific location (lat & long) when device location is enabled
  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!isServiceEnabled){
      return Future.error("Location is not enabled");
    }

    // status of permission location
    locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location permission is denied forever");
    }else if(locationPermission == LocationPermission.denied){
      //request permission
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error("User denied to grant location permission");
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((gottenValues) {
      _latitude.value  = gottenValues.latitude;
      _longitude.value = gottenValues.longitude;
      print("(Lat: ${gottenValues.latitude} , Long: ${gottenValues.longitude})");

      // When Lat. & Long. is gotten; - - Get weather data from api
      return getWeatherData(gottenValues.latitude, gottenValues.longitude).then((value) {
        _isLoading.value = false;
      });
      
    });


  }



  // A function which gets the needed weather data from th API. It uses Lat. & Long. to get a specific weather data
  Future<void> getWeatherData(lat, long) async{

   try{
    String apiKey = API.weatherApiKey;
    Response response = await _getConnect.get('https://api.openweathermap.org/data/3.0/onecall?lat=${lat}&lon=${long}&appid=${apiKey}&units=metric&exclude=minutely');
    
    _weatherModel = WeatherModel.fromJson(response.body);
    print("OVERALL WEATHER ::: $_weatherModel"); // testing

    // populating our current weather data
    currentWeatherDataList.add(_weatherModel.current); 
    print("CURRENT WEATHER LIST: $currentWeatherDataList"); 

    // populating our daily weather data List
    _dailyWeatherList.clear();
    _dailyWeatherList = _weatherModel.daily;
    print("DAILY ::: $_dailyWeatherList"); // testing

    // populating our hourly weather data List
    _hourlyWeatherList.clear();
    _hourlyWeatherList = _weatherModel.hourly;

   }catch (e){
    print("GET WEATHER error : $e");
   }


  }



  // A function which return the current index given to it by the tapped HourlyCard
  getCurrentIndex(){
    return _currentIndex;
  }




}