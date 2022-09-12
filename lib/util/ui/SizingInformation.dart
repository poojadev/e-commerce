import 'package:flutter/widgets.dart';

import '../enums/DeviceScreenType.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.orientation,
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
