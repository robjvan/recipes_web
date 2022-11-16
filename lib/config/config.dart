// Uri _weatherApiUrl = Uri.parse('http://api.yourcookbook.ca/');
import 'package:platform_plus/platform_plus.dart';

Uri _recipesApiUrl = Uri.parse('http://localhost:3000/');

class Config {
  final Uri _apiUrl = _recipesApiUrl;

  Uri get apiUrl => _apiUrl;

  static Config? _configState;

  factory Config() {
    if (_configState == null) {
      Config._configState = Config._internal();
    }
    return Config._configState!;
  }

  Config._internal();

  /// Returns the platform currently in use (web, ios, android, windows, linux, or macos)
  Future<String> getPlatform() async {
    final PlatformPlus userPlatform = PlatformPlus.platform;

    if (userPlatform.isAndroidNative) {
      return 'android';
    } else if (userPlatform.isIOSNative) {
      return 'ios';
    } else if (userPlatform.isLinuxNative) {
      return 'linux';
    } else if (userPlatform.isWindowsNative) {
      return 'windows';
    } else if (userPlatform.isMacOSNative) {
      return 'macos';
    } else {
      return 'web';
    }
  }
}

Uri getAPIUrl() => Config().apiUrl;
