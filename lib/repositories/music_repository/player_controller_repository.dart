import 'package:audioplayers/audioplayers.dart';

class PlayerControllerRepository {
  AudioPlayer audioPlayer = AudioPlayer(playerId: '');

  Future<void> play(String musicFileUrl) async {
    final res = await audioPlayer.play(musicFileUrl);

    if (res != 1) {
      throw 'audio load error!';
    }
  }

  Future<void> pause() async {
    await audioPlayer.pause();
  }
}
