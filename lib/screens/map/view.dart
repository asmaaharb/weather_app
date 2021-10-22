import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/screens/home/controller.dart';
import 'package:weather/screens/home/model.dart';

class MapView extends StatefulWidget {

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
   List <Marker> markers =[];
   WeatherModel _weatherModel;

  
  onTap(LatLng point)async{
    setState(() {
      markers=[];
      markers.add(Marker(markerId: MarkerId(point.toString()),
        position:point,));


      
    });
  
  HomeController homeController= HomeController();
  _weatherModel = await homeController.getData(point.latitude.toString(), point.longitude.toString());
  showModalBottomSheet(context: context,
      isScrollControlled: true,
      backgroundColor: Colors.blueAccent[100],
      builder: (context)=>Container(
        height: MediaQuery.of(context).size.height/2,
        child: Column(
          children: [
            Text(_weatherModel.name),
            Text(_weatherModel.main.temp.toString()),
            Text(_weatherModel.main.humidity.toString()),
          ],
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition:  CameraPosition(
          target: const LatLng(0, 0),
          zoom: 2,
        ),
         markers: Set.from(markers),
         onTap:onTap ,
         mapType: MapType.normal,
)
    );
  }
}