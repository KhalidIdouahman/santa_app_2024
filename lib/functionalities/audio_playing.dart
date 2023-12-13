import 'package:audioplayers/audioplayers.dart';
// import 'package:path_provider/path_provider.dart';

class SoundPlayer {
  // creates an object of the audio player
  final audioPlayer = AudioPlayer();

  Future<void> playSound(String soundPath) async {
    // make the file path string to a source to work in the audio player.
    final audioFile = AssetSource(soundPath);
    // to make the audio plays forever until it stops .
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    // this plays the audio
    await audioPlayer.play(audioFile);
  }

  Future<void> stopSound() async {
    // this stops the audio
    await audioPlayer.stop();
  }

// this to get the audio with the path from the device , i think?
  // Future<String> _getLocalFilePath(String soundPath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = '${directory.path}/$soundPath';
  //   return path;
  // }
}
