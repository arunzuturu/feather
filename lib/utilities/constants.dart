import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const kContainerColor = Color(0xFF4A73FC);
const kSmallCardColor = Color(0xFF668CFF);
const kBrownCardColor = Color(0xFF886943);
const kIconColor = Color(0xFF4B4B4B);

const kCardTextColor = Color(0xFFAACAFF);

const kTempTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Color(0xFFAACAFF),
  icon: Icon(
    Icons.location_searching,
    color: Colors.black,
  ),
  hintText: " Enter a City Name",
  hintStyle: TextStyle( color: Colors.black
  ),
);

dynamic kBasicTextStyle = TextStyle(
  color: Color(0xFFA1ADCE),
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 30,

);
dynamic kCardTextStyle = TextStyle(
  color: kCardTextColor,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w100,
  fontSize: 32,
);

dynamic kCardTitle = TextStyle(
  color: kCardTextColor,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.normal,
  fontSize: 18,
);