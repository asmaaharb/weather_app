import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/screens/map/view.dart';
import 'package:weather/screens/search/search_view.dart';
import 'package:weather/widgets/text.dart';

import 'controller.dart';
import 'model.dart';
class HomeView extends StatefulWidget {
  const HomeView(this.currentLocation) ;
final  Position currentLocation;
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  WeatherModel data;
  bool isLoading = true;
  setData() async {
    print(widget.currentLocation);
    data = (await HomeController().getData("${widget.currentLocation.latitude}","${widget.currentLocation.longitude}"));

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        body:  isLoading
            ? Center(child: CircularProgressIndicator())
            :Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(

              image: DecorationImage(image: AssetImage("assets/images/home.jpg"),fit: BoxFit.cover)),
              child: Column(
          children: [
            Row(
              children: [
                IconButton(icon:Icon(Icons.search,color: Colors.white,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchView()));
                  },),
                IconButton(icon:Icon(Icons.map,color: Colors.white,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));
                  },)
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 150.0),
              child: Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: MediaQuery.of(context).size.height/3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(.2)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.place_outlined,color: Colors.white,),
                        ),
                        HomeHint(data:data.name ,),
                      ],
                    ),
                    HomeHint(data:data.main.temp.toString() ,),
                    HomeHint(data:data.main.humidity.toString()),

                  ],
                ),
              ),
            ),

          ],
        ),
            ),
      ),
    );
  }
}
