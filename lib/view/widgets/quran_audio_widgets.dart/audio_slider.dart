import 'package:flutter/material.dart';

import '../../../core/constant/colors/app_color.dart';

class AudioSlider extends StatelessWidget {
  const AudioSlider({
    super.key,
    required this.max,
    required this.value,
    required this.onChanged,
  });
  final double max;
  final double value;
  final void Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      activeColor: AppColor.kBlueColor,
      inactiveColor: AppColor.kBackGroundColor,
      thumbColor: AppColor.kGreenColor,
      max: max,
      value: value,
      onChanged: onChanged,
    );
  }
}
