import 'package:business_layer/app/core/environments/environments.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvEnvironments implements Environments {
  @override
  String? getValue(String key) {
    return dotenv.env['VAR_NAME']?.toString();
  }

  @override
  Future<void> initialize() async {
    await dotenv.load();
  }
}