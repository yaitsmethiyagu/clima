import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../utilities/constants.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();

    super.initState();
  }

  void getLocation() async {
    // WeatherModel weatherModel = WeatherModel();
    WeatherModel();
    dynamic weatherResult = await WeatherModel().getWeatherdatas();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherResult);
    }));
  }

  // void getWheather() async {
  //   // http.Response response = await http.get(
  //   //   openWeatherQuery,
  //   //   // headers: {
  //   //   //   "Access-Control-Allow-Origin": "*",
  //   //   //   'Content-Type': 'application/json',
  //   //   //   'Accept': '*/*'
  //   //   // },
  //   // );
  //
  //   http.Response response = await http
  //       .get(Uri.https('api.openweathermap.org', '/data/2.5/weather', {
  //     'lat': deviceLat.toString(),
  //     'lon': deviceLon.toString(),
  //     'appid': apiKey,
  //   }));
  //   if (response.statusCode == 200) {
  //     String weatherData = response.body;
  //
  //   } else {
  //     print(response.statusCode);
  //   };
  // }

  // final Uri openWeatherQuery =
  //     Uri.https('api.openweathermap.org', '/data/2.5/weather', {
  //   'lat': deviceLat.toString(),
  //   // 'lat': '72.8776559',
  //   // 'lon': '19.0759837',
  //
  //   'lon': deviceLon.toString(),
  //   'appid': apiKey,
  // });

  // Uri openWeatherQuery = Uri(
  //     scheme: "https",
  //     host: "api.openweathermap.org",
  //     path: '/data/2.5/weather',
  //     pathSegments: [
  //       'data',
  //       '2.5',
  //       'weather'
  //     ],
  //     queryParameters: {
  //       "lat": location.lattitude,
  //       "lon": location.longtitude,
  //       "appid": "cf3a6ab0235a6ba9cc84605317f55fcb",
  //     });

  // }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoadingAnimationWidget.newtonCradle(color: Colors.white, size: 200.0),
          Transform.translate(
            offset: Offset(0, -50),
            child: Text(
              'Loading weather data',
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
