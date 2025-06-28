import 'package:audioplayers/audioplayers.dart';
import 'package:ritim/product/constants/asset_constants.dart';

class AudioPlayerHelper {
  static final _player = AudioPlayer();

  static Future<void> playAlarm() =>
      _player.play(AssetSource(AssetConstants.alarm));

  static Future<void> stopAlarm() => _player.stop();
}
