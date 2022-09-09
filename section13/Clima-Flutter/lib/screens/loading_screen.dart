import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.yellow,
        size: 100,
      ),
    );
  }

  void getLocation() async {
    Location location = Location();
    await location.loadCurrent();
    print(location.lat);
    print(location.lon);
    getData(location);
  }

  void getData(Location location) async {
    double lat = location.lat;
    double lon = location.lon;
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric');

    if (response.statusCode == 200) {
      String data = response.body;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            locationWeather: data,
          ),
        ),
      );
    } else {
      print(response.statusCode);
    }
  }
}

const _apiKey = 'bbd7a96cc299d6cce6be0e448ca6d5f3';
