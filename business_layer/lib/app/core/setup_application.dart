import 'package:business_layer/app/core/environments/dotenv_environments.dart';
import 'package:business_layer/app/core/environments/environments.dart';

class SetupApplication {
  SetupApplication._();

  static Future<void> initialize({
    Environments? environments,
  }) async {
    await (environments ?? DotenvEnvironments()).initialize();
  }
}