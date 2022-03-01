import 'package:business_layer/app/core/environments/dotenv_environments.dart';
import 'package:business_layer/app/core/local_storage/local_storage.dart';
import 'package:business_layer/app/core/local_storage/shared_preferences_local_storage.dart';
import 'package:business_layer/app/core/rest_client/dio_rest_client.dart';
import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/business_layer.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModuleAdapter {
  CoreModuleAdapter._();

  static List<Bind> binds({
    Environments? environments,
    RestClient? restClient,
    LocalStorage? localStorage,
  }) => [
    Bind.lazySingleton<Environments>((i) => environments ?? DotenvEnvironments(), export: true),
    Bind.lazySingleton<RestClient>((i) => restClient ?? DioRestClient(environments: i()), export: true),
    Bind.lazySingleton<LocalStorage>((i) => localStorage ?? SharedPreferencesLocalStorage(), export: true),
  ];
}