import 'package:flutter/material.dart';

enum DeviceType { phone, tablet }

DeviceType getDeviceType({required BuildContext context}) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
}
