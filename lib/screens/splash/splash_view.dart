import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/screens/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {

Position currentLocation;
   Future<Position> getCurrentPosition()async{
     final status = await Geolocator.checkPermission();
     if(status == LocationPermission.deniedForever)
       await Geolocator.openAppSettings();
     else if (status != LocationPermission.always || status != LocationPermission.whileInUse)
       await Geolocator.requestPermission();
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  }
  getUserLocation()async{
     currentLocation=await getCurrentPosition();
     setState(() {
       print(currentLocation.latitude);
       print(currentLocation.longitude);

     });
     print(currentLocation);
     Timer(Duration(seconds: 5), (){  Navigator.pushAndRemoveUntil(
         context, MaterialPageRoute(builder: (context)=>HomeView(currentLocation)),
         (v){return true;}
     );});
  }


  @override
  void initState() {
    getUserLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splash.jpg"),fit: BoxFit.cover)),
        child: Center(child: Text("WEATHER",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width/12),)),

      ),
    );
  }
}
