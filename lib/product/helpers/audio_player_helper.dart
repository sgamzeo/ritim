import 'package:audioplayers/audioplayers.dart';
import 'package:ritim/product/constants/asset_constants.dart';
import 'package:ritim/product/constants/enums.dart';

class AudioPlayerHelper {
  static final _player = AudioPlayer();

  static Future<void> playAlarm() =>
      _player.play(AssetSource(AssetConstants.alarm));

  static Future<void> stopAlarm() => _player.stop();

  static Future<void> handleStatus(PomodoroStatus status) async {
    if (status == PomodoroStatus.finished) {
      await playAlarm();
    } else {
      await stopAlarm();
    }
  }
}
