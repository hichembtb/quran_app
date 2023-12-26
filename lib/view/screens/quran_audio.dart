import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quran_audio_controller.dart';
import '../../core/configuration/size_config.dart';
import '../../core/constant/colors/app_color.dart';
import '../../core/constant/images/app_images.dart';
import '../../core/functions/format_time.dart';
import '../../core/shared/widget/appbar.dart';
import '../widgets/quran_audio_widgets.dart/audio_slider.dart';

class QuranAudio extends StatelessWidget {
  const QuranAudio({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    QuranAudioController quranAudioController = Get.put(QuranAudioController());
    return Scaffold(
      appBar: kAppBar,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<QuranAudioController>(
          init: QuranAudioController(),
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    kAudioImage,
                    width: double.infinity,
                    height: SizeConfig.screenHeight! * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.032,
                ),
                Text(
                  quranAudioController.sourah!.arName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.004,
                ),
                Text(
                  quranAudioController.sourah!.frName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.004,
                ),
                AudioSlider(
                  max: quranAudioController.duration.inSeconds.toDouble(),
                  value: quranAudioController.position.inSeconds.toDouble(),
                  onChanged: (value) =>
                      quranAudioController.onSliderChange(value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(quranAudioController.position)),
                      Text(formatTime(quranAudioController.duration -
                          quranAudioController.position)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColor.kBackGroundColor,
                  child: IconButton(
                    icon: Icon(
                      quranAudioController.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    iconSize: 50,
                    color: AppColor.kGreenColor,
                    onPressed: () => quranAudioController.playPause(
                        '${quranAudioController.sourah!.frName}.mp3'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
