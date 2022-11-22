// Uri _weatherApiUrl = Uri.parse('http://api.yourcookbook.ca/');
import 'package:get/get.dart';

Uri _recipesApiUrl = Uri.parse('http://10.0.0.79:3000'); // workstation
// Uri _recipesApiUrl = Uri.parse('http://10.0.0.242:3000'); // tablet

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
    if (GetPlatform.isWeb) {
      return 'web';
    } else if (GetPlatform.isAndroid) {
      return 'android';
    } else if (GetPlatform.isIOS) {
      return 'ios';
    } else if (GetPlatform.isLinux) {
      return 'linux';
    } else if (GetPlatform.isWindows) {
      return 'windows';
    } else if (GetPlatform.isMacOS) {
      return 'macos';
    } else {
      return 'unknown';
    }
  }
}

Uri getAPIUrl() => Config().apiUrl;
