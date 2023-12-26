import 'package:firebase_storage/firebase_storage.dart';

class AudioService {
  static Future<String?> loadAudio(String surahName) async {
    try {
      final audioRef = FirebaseStorage.instance.ref("audio").child(surahName);

      final url = await audioRef.getDownloadURL();
      return url;
    } catch (error) {
      return null;
    }
  }
}
