
import 'package:clima/screens/city_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:sizer/sizer.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  String weatherIcon;
  String city;
  String message;
  String description;
  double feelsLike;
  int pressure;
  double wind;
  int humidity;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == Null) {
      temp = 0;
      weatherIcon = "Error";
      message = "Unable to get weather data, retry!";
      city = " ";
      return;
    }
    double wind1 = weatherData['wind']['speed'];
    wind = wind1.toDouble();
    int pressure1 = weatherData['main']['pressure'];
    pressure = pressure1;
    double feelsLike1 = weatherData['main']['feels_like'];
    feelsLike = feelsLike1.toDouble();
    description = weatherData['weather'][0]['description'];
    double temperature = weatherData['main']['temp'];
    temp = temperature.toInt();
    message = weatherModel.getMessage(temp);
    var id = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(id);
    city = weatherData['name'];
    humidity = weatherData['main']['humidity'];
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(1.w),
          child: SingleChildScrollView(
            child: Column(
                children: [
              Container(
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async{
                         var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {return CityScreen();}));
                         print(typedName);
                         if(typedName != null){
                          var weatherData1 = await weatherModel.getCityWeather(typedName);
                          setState(() {
                            updateUI(weatherData1);
                          });
                         }
                        },
                      child: Icon(
                        Icons.search_outlined,
                        color: kIconColor,
                        size: 30.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async{
                        var weatherData = await weatherModel.getLocationWeather();
                        setState(() {
                          updateUI(weatherData);
                        });
                      },
                      child: Icon(
                        Icons.location_on_outlined,
                        color: kIconColor,
                        size: 30.0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Text("$city", style: kBasicTextStyle),
                ],
              ),
              SizedBox(
                height: 2.25.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)), // Set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey,
                          offset: Offset(1, 3))
                    ]),
                height: 70.h,
                width: 92.w,
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 1.w,
                    // ),
                    Center(
                        child: Image.asset(
                      '$weatherIcon',
                      height: 11.h,
                      width: 11.h,
                    )),
                    SizedBox(
                      height: 2.25.w,
                    ),
                    Text(
                      "$description",
                      style: kCardTextStyle,
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "$temp°",
                          style: kTempTextStyle,
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                      indent: 2,
                      endIndent: 2,
                      color: Colors.white70,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.w),
                      child: Row(
                        children: [
                          // SizedBox(
                          //   height: 5.h,
                          //   width: 5.w,
                          // ),
                          Image.asset(
                            'icons/wind.png',
                            height: 40,
                            width: 40,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "WIND",
                                style: kCardTitle,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "$wind",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Image.asset(
                            'icons/003-high-temperatures.png',
                            height: 40,
                            width: 40,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "FEELS LIKE",
                                style: kCardTitle,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                               Text(
                                 "$feelsLike",
                                style:
                                 TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(1.w),
                      child: Row(
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Image.asset(
                            'icons/004-gauge.png',
                            height: 40,
                            width: 40,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "PRESSURE",
                                style: kCardTitle,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "$pressure",
                                style:
                                TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Image.asset(
                            'icons/humidity.png',
                            height: 40,
                            width: 40,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "HUMIDITY",
                                style: kCardTitle,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "$humidity",
                                style:
                                TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //OPTIONAL NEXT 7 DAYS WEATHER
              // Container(
              //   padding: const EdgeInsets.all(15.0),
              //   decoration: BoxDecoration(),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         width: 100,
              //       ),
              //       Text(
              //         "Next 7 days",
              //         style: TextStyle(
              //           fontFamily: 'OpenSans',
              //           fontWeight: FontWeight.normal,
              //           fontSize: 20,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       GestureDetector(
              //         onTap: (){},
              //           child: Icon(Icons.arrow_forward_ios_sharp)),
              //     ],
              //   ),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}


