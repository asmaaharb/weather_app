import 'package:flutter/material.dart';
import 'package:weather/screens/home/model.dart';
import 'package:weather/screens/search/controller.dart';

import 'components/null_hint.dart';
import 'components/result_box.dart';
import 'components/result_text.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController1;

  WeatherModel _searchResponse;

  bool isLoading = false;
  SearchController _searchController = SearchController();
  gettingData(city) async {
    setState(() {
      isLoading = true;
    });
    _searchResponse = await _searchController.getData(city);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/search.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 45.0, left: 5, right: 5, bottom: 30),
                child: Container(
                  height: 45,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          )),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: TextEditingController(),
                          onFieldSubmitted: (value) {
                            gettingData(value);
                          },
                          decoration: InputDecoration(
                              hintText: 'Search Here',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      child: _searchResponse == null
                          ? NullHint()
                          : Results(
                              name: _searchResponse.name,
                              temp: _searchResponse.main.temp.toString(),
                              country: _searchResponse.sys.country.toString() ?? '',
                              hum: _searchResponse.main.humidity.toString(),
                            ))
            ],
          ),
        ),
      ),
    );
  }
}
