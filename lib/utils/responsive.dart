import 'package:flutter/material.dart';

class Responsive {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static bool isSinhalaOrTamil = false;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    try {
      final locale = Localizations.localeOf(context);
      isSinhalaOrTamil = locale.languageCode == 'si' || locale.languageCode == 'ta';
    } catch (e) {
      isSinhalaOrTamil = false;
    }
  }

  
  static double setFontSize(double size) {
    double scale = screenWidth / 375;
    if (isSinhalaOrTamil) {
      scale *= 0.85; 
    }
    return size * scale;
  }

  
  static double setWidth(double width) {
    return width * (screenWidth / 375);
    
  }

 
  static double setHeight(double height) {
    return height * (screenHeight / 812);
  }
}
