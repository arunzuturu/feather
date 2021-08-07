import 'dart:io';
import 'package:geolocator/geolocator.dart';

class Locator{
  double latitude;
   double longitude;

   Future<void>getLocation() async{
     try {
       Position position = await Geolocator.getCurrentPosition(
           desiredAccuracy: LocationAccuracy.best);
       print(position);
       latitude = position.latitude;
       longitude = position.longitude;
     }catch(e){
       print(e);
     }
   }

}