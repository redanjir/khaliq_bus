import 'package:flutter/material.dart';

class Styles {
  //Font sizes
  static const LargeTextSize = 45.0;
  static const MediumTextSize = 25.0;
  static const SmallTextSize = 15.0;
  static const BodyTextSize = 17.0;
  static const ButtonTextSize = 16.0;

  //Light colors
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const lightblue = Color.fromRGBO(198, 224, 242, 1);
  static const midblue = Color.fromRGBO(188, 224, 253, 1);
  static const blue = Color.fromRGBO(127, 196, 253, 1);
  static const darkblue = Color.fromRGBO(38, 153, 251, 1);

  //Miscellaneous colors
  static const red = Color.fromRGBO(247, 129, 129, 1);
  static const gray = Color.fromRGBO(218, 211, 211, 1);

  //Fonts
  static const String BodyFont = 'Arimo';
  static const String LogoApp = 'Gelasio';

  static const AppBarTextStyle = TextStyle(
    fontFamily: BodyFont,
    fontWeight: FontWeight.w600,
    fontSize: MediumTextSize,
    color:  darkblue,
  );

  static const AppLogoTextStyle = TextStyle(
    fontFamily: LogoApp,
    fontWeight: FontWeight.bold,
    fontSize: LargeTextSize,
    color: darkblue, 
  );

  static const BodyTextStyle = TextStyle(
    fontFamily: BodyFont,
    fontWeight: FontWeight.w400,
    fontSize: BodyTextSize,
    color: darkblue,
  );

  static const LinkTextStyle = TextStyle(
    fontFamily: BodyFont,
    fontWeight: FontWeight.w400,
    fontSize: BodyTextSize,
    color: darkblue,
  );

  static const TitleTextStyle = TextStyle(
    fontFamily: BodyFont,
    fontWeight: FontWeight.bold,
    fontSize: BodyTextSize,
    color: darkblue,
  );

  static const labelTextStyle = TextStyle(
    fontFamily: BodyFont,
    fontWeight: FontWeight.bold,
    fontSize: SmallTextSize,
    color: darkblue,
  );
  
  static const ButtonTextStyle = TextStyle( 
    fontFamily: BodyFont,
    fontWeight: FontWeight.w600,
    fontSize: ButtonTextSize,
    color: Colors.white,
  );

  static const DrawerHeaderTextStyle = TextStyle( 
    fontFamily: BodyFont,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.white,
  );
}