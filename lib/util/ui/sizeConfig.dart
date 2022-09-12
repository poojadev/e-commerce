import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
  }
}

//DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
//  var orientation = mediaQuery.orientation;
//  double deviceWidth = 0;
//  if (orientation == Orientation.landscape) {
//    deviceWidth = mediaQuery.size.height;
//  } else {
//    deviceWidth = mediaQuery.size.width;
//  }
//  if (deviceWidth > 950) {
//    return DeviceScreenType.Desktop;
//  }
//  if (deviceWidth > 600) {
//    return DeviceScreenType.Tablet;
//  }
//  return DeviceScreenType.Mobile;
//}