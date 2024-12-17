import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static const String settingsBox = 'settings';
  static const String cacheBox = 'cache';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(settingsBox);
    await Hive.openBox(cacheBox);
  }

  static Box _getBox(String boxName) {
    return Hive.box(boxName);
  }

  // Settings methods
  static Future<void> saveSettings(String key, dynamic value) async {
    final box = _getBox(settingsBox);
    await box.put(key, value);
  }

  static dynamic getSettings(String key, {dynamic defaultValue}) {
    final box = _getBox(settingsBox);
    return box.get(key, defaultValue: defaultValue);
  }

  // Cache methods
  static Future<void> saveCache(String key, dynamic value) async {
    final box = _getBox(cacheBox);
    await box.put(key, value);
  }

  static dynamic getCache(String key, {dynamic defaultValue}) {
    final box = _getBox(cacheBox);
    return box.get(key, defaultValue: defaultValue);
  }

  static Future<void> clearCache() async {
    final box = _getBox(cacheBox);
    await box.clear();
  }

  static Future<void> deleteCache(String key) async {
    final box = _getBox(cacheBox);
    await box.delete(key);
  }
} 