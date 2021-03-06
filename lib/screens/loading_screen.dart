
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  String appId = '88465afd3196eb1a2a46d40b2edf4a57';

  void getLocation() async{
    var weatherData = await WeatherModel().getLocationWeather();
        Navigator.push(context, MaterialPageRoute(builder: (context) {return LocationScreen(locationWeather: weatherData,);}
        ));
  }



  @override
  void initState() {
    print("Init is called");
    super.initState();
    getLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.blueAccent,
          size: 44.0,
        ),
      ),

    );
  }
}
