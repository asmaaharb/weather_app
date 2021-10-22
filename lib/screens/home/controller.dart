import 'package:dio/dio.dart';

import 'model.dart';

class HomeController{
  Dio dio = Dio();
  Future<WeatherModel> getData(String lat,String long) async {

    final response = await dio.get('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=9c15af06166e304ab03ac7075db2b74a');

    if (response.statusCode == 200) {
      final app=response.data ;
      print('getting data');




      return WeatherModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load ');
    }
  }}