import 'package:dio/dio.dart';
import 'package:weather/screens/home/model.dart';


class SearchController{
  final _dio = Dio();
  Future<WeatherModel> getData (city) async{

    try{
      final resonse = await _dio.get('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=9c15af06166e304ab03ac7075db2b74a');
      final resp = resonse.data;
      print(resp);
      return resonse.statusCode == 200 ? WeatherModel.fromJson(resp) : null ;
    } catch(e) {
      return  throw Exception('Failed to load ');
    }
  }
}