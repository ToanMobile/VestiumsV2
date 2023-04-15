import 'package:get_storage/get_storage.dart';

import '/res/languages/localization_service.dart';
import '/res/theme/theme_service.dart';

class TravelStorage {
  late GetStorage box;
  static const STORAGE_NAME = "neta_travel_storage";
  static const USER_ACCESS_TOKEN = "user_access_token";
  static const TRAVEL_USER_INFO = "telemed_user_info";
  static const APP_NEW_INSTALL = "app_new_install";
  static const APP_THEME = "app_theme";
  static const APP_LANGUAGE = "app_language";
  static const DEVICE_TOKEN = "device_token";
  static const PHOTO_CDN = "photo_url_cdn";

  init() async {
    await GetStorage.init(STORAGE_NAME);
    box = GetStorage(STORAGE_NAME);
  }

  Future<void> saveUrlCND(String cdn) async {
    box.write(PHOTO_CDN, cdn);
  }

  Future<String?> getUrlCDN() async {
    final urlCDN = await box.read(PHOTO_CDN);
    return urlCDN;
  }

  Future<void> saveDeviceToken(String deviceToken) async {
    box.write(DEVICE_TOKEN, deviceToken);
  }

  Future<String?> getDeviceToken() async {
    final token = await box.read(DEVICE_TOKEN);
    return token;
  }

  Future<void> saveUserAccessToken(String accessToken) async {
    box.write(USER_ACCESS_TOKEN, accessToken);
  }

  Future<String?> getUserAccessToken() async {
    final token = await box.read(USER_ACCESS_TOKEN);
    return token;
  }
/*

  Future<void> saveUserInfo(TUser user) async {
    String json = jsonEncode(user.toJson());
    box.write(TRAVEL_USER_INFO, json);
  }

  Future<TUser?> getUserInfo() async {
    final userJson = await box.read(TRAVEL_USER_INFO);
    return userJson != null ? TUser.fromJson(json.decode(userJson)) : null;
  }
*/

  Future<void> saveInstall(bool isInstall) async {
    box.write(APP_NEW_INSTALL, isInstall);
  }

  Future<bool> isInstall() async {
    final isInstall = await box.read(APP_NEW_INSTALL) ?? false;
    return isInstall;
  }

  Future<void> setTheme(int theme) async {
    box.write(APP_THEME, theme);
  }

  Future<int> getTheme() async {
    final theme = await box.read(APP_THEME) ?? ThemeService.LIGHT_THEME;
    return theme;
  }

  Future<void> setLanguage(String language) async {
    box.write(APP_LANGUAGE, language);
  }

  Future<String> getLanguage() async {
    final theme = await box.read(APP_LANGUAGE) ?? LocalizationService.VI_VN;
    return theme;
  }

  Future<void> logout() async {
    if (box.hasData(APP_LANGUAGE)) await box.remove(APP_LANGUAGE);
    if (box.hasData(APP_THEME)) await box.remove(APP_THEME);
    if (box.hasData(TRAVEL_USER_INFO)) await box.remove(TRAVEL_USER_INFO);
    if (box.hasData(USER_ACCESS_TOKEN)) await box.remove(USER_ACCESS_TOKEN);
  }
}
