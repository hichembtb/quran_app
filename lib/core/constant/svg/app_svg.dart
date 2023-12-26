import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture kCompassSvg = SvgPicture.asset("assets/svg/compass.svg");
SvgPicture kNeedleSvg = SvgPicture.asset(
  "assets/svg/needle.svg",
  fit: BoxFit.contain,
  height: 300,
  alignment: Alignment.center,
);
