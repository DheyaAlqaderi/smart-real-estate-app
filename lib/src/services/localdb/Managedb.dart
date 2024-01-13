import 'package:flutter/cupertino.dart';
import 'package:smart_real_estate_app/src/services/localdb/LocalDatabase.dart';

class Managedb {
  static Future<void> saveToken(String token) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the local database
    final LocalDatabase localDatabase = LocalDatabase();
    await localDatabase.initialize();
    // Insert a token
    await localDatabase.insertToken(token);
  }

  static Future<String?> getToken() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the local database
    final LocalDatabase localDatabase = LocalDatabase();
    await localDatabase.initialize();

    final String? retrievedToken = await localDatabase.getToken();
    return retrievedToken;
  }
}

