import 'package:flutter/material.dart';

const LargeTextSize = 45.0;
const MediumTextSize = 23.0;
const SmallTextSize = 15.0;
const BodyTextSize = 17.0;
const ButtonTextSize = 16.0;

const lightblue = Color.fromRGBO(241, 249, 255, 1);
const midblue = Color.fromRGBO(188, 224, 253, 1);
const blue = Color.fromRGBO(127, 196, 253, 1);
const darkblue = Color.fromRGBO(38, 153, 251, 1);

const String BodyFont = 'Arimo';
const String LogoApp = 'Gelasio';

const AppBarTextStyle = TextStyle(
  fontFamily: BodyFont,
  fontWeight: FontWeight.w600,
  fontSize: LargeTextSize,
  color: Colors.white,
);

const AppLogoTextStyle = TextStyle(
  fontFamily: LogoApp,
  fontWeight: FontWeight.bold,
  fontSize: LargeTextSize,
  color: darkblue, 
);

const BodyTextStyle = TextStyle(
  fontFamily: BodyFont,
  fontWeight: FontWeight.w400,
  fontSize: BodyTextSize,
  color: darkblue,
);
 
const ButtonTextStyle = TextStyle( 
  fontFamily: BodyFont,
  fontWeight: FontWeight.w600,
  fontSize: ButtonTextSize,
  color: Colors.white,
);

const AppFont = TextStyle(
  fontFamily: LogoApp,
  fontWeight: FontWeight.bold,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const TFTextStyle = TextStyle(
  fontFamily: BodyFont,
  fontWeight: FontWeight.w600,
  fontSize: ButtonTextSize,
  color: Colors.black,
);

const RBTextStyle = TextStyle(
  fontFamily: BodyFont,
  fontWeight: FontWeight.w600,
  fontSize: SmallTextSize,
  color: Colors.black,
);
