import 'package:anywhere_coding_exercise/flavors.dart';
import 'package:flutter/material.dart';

enum DeviceType { phone, tablet }

DeviceType getDeviceType({required BuildContext context}) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
}

String getApiUrl() {
  return switch (F.appFlavor) {
    Flavor.simpsons => "simpsons+characters&format=json",
    Flavor.wire => "the+wire+characters&format=json",
    null => "simpsons+characters&format=json"
  };
}
