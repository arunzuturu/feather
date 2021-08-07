import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  String url;

  Future getData() async{
    var k =Uri.parse(url);
    Response response = await get(k);
    if(response.statusCode==200){
      String data = response.body;
      var decodeData = jsonDecode(data);
      // print(decodeData['main']['temp']);
      return decodeData;
    }else{
      print(response.statusCode);
    }
  }

}