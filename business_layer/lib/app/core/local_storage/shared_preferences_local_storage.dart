import 'package:business_layer/app/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sp = await _instance;
    await sp.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sp = await _instance;
    return sp.containsKey(key);
  }

  @override
  Future<T?> read<T>(String key) async {
    final sp = await _instance;
    return sp.get(key) as T?;
  }

  @override
  Future<void> remove(String key) async {
    final sp = await _instance;
    await sp.remove(key);
  }

  @override
  Future<void> write<T>(String key, T? data) async {
    final sp = await _instance;
    if (T == String) {
      await sp.setString(key, data as String);
    }
    else if (T == bool) {
      await sp.setBool(key, data as bool);
    }
    else if (T == double) {
      await sp.setDouble(key, data as double);
    }
    else if (T == int) {
      await sp.setInt(key, data as int);
    }
    else if (T == List) {
      await sp.setStringList(key, data as List<String>);
    }
    else {
      throw Exception('Type not found');
    }
  }
  
}