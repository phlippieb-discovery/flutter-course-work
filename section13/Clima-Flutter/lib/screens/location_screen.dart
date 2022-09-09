import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'dart:convert' as convert;
import 'package:clima/services/weather.dart' as weather;

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    // double tempAsDouble =
    //     (convert.jsonDecode(widget.locationWeather)['main']['temp'] as double).toInt();
    // int temp = tempAsDouble.toInt();
    int condition =
        convert.jsonDecode(widget.locationWeather)['weather'][0]['id'];
    String city = convert.jsonDecode(widget.locationWeather)['name'];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${_getTemperature()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      _getIcon(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  _getMessage(),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getTemperature() =>
      (convert.jsonDecode(widget.locationWeather)['main']['temp'] as double)
          .toInt();
  String _getIcon() => weather.WeatherModel().getWeatherIcon(_getCondition());
  String _getMessage() =>
      weather.WeatherModel().getMessage(_getCondition()) +
      ' in ' +
      _getCityName();
  int _getCondition() =>
      convert.jsonDecode(widget.locationWeather)['weather'][0]['id'] as int;
  String _getCityName() => convert.jsonDecode(widget.locationWeather)['name'];
}
