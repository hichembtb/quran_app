import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../core/services/audio_service.dart';
import '../models/quran_model.dart';

class QuranAudioController extends GetxController {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  QuranModel? sourah;

  @override
  void onInit() {
    super.onInit();
    sourah = Get.arguments["sourahName"];

    //! listen to states : playing , pause, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
      update();
    });
    //! Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
      update();
    });
    //! Listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
      update();
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    Get.delete<QuranAudioController>();
    super.onClose();
  }

  Future onSliderChange(double value) async {
    final position = Duration(seconds: value.toInt());
    await audioPlayer.seek(position);
    //? Optional : play audio if paused
    await audioPlayer.resume();
  }

  Future playPause(String surahName) async {
    String? audioUrl = await AudioService.loadAudio(surahName);
    if (isPlaying) {
      await audioPlayer.pause();
      isPlaying = !isPlaying;
    } else {
      await audioPlayer.play(
        UrlSource(
          audioUrl!,
        ),
      );
      isPlaying = !isPlaying;
    }
    update();
  }
}
