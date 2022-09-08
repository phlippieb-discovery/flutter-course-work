import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void getLocation() async {
    Location location = Location();
    await location.loadCurrent();
    print(location.lat);
    print(location.lon);
  }
}

void getData() async {
  http.Response response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$_apiKey');

  if (response.statusCode == 200) {
    String data = response.body;
    //

    // Temp
    var temp = convert.jsonDecode(data)['main']['temp'];
    print(temp);

    // condition
    var condition = convert.jsonDecode(data)['weather'][0]['id'];
    print(condition);

    // city
    var city = convert.jsonDecode(data)['name'];
    print(city);
  } else {
    print(response.statusCode);
  }
}

const _apiKey = 'bbd7a96cc299d6cce6be0e448ca6d5f3';
