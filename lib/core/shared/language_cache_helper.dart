import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {

  static Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Locale", languageCode);
  }

  static Future<String?> getCachedLanguage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("Locale");
    return cachedLanguageCode;
  }

}