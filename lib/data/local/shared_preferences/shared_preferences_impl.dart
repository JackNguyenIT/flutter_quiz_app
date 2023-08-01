import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/data/local/shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements SharedPreferences {
  static const String _boxName = 'shared_preference_qa_box';
  static const String _encryptedBoxName = 'shared_encrypted_preference_qa_box';
  static const String _encryptionKeyAlias = 'shared_encrypted_preference_qa_key';

  final Box _sharedEncryptedBox;

  SharedPreferencesImpl._(Box sharedBox, Box encryptedBox)
      : _sharedEncryptedBox = encryptedBox;

  static Future<SharedPreferences> getInstance() async {
    final box = await Hive.openBox(_boxName);
    Box encryptedBox;
    try {
      encryptedBox = await _createEncryptedBox();
    } catch (ex) {
      encryptedBox = await Hive.openBox(_encryptedBoxName);
    }
    return SharedPreferencesImpl._(box, encryptedBox);
  }

  static Future<Box> _createEncryptedBox() async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final secretKey = await secureStorage.read(key: _encryptionKeyAlias);
    if (secretKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: _encryptionKeyAlias,
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: _encryptionKeyAlias);
    final encryptionKey = base64Url.decode(key!);
    return await Hive.openBox(
      _encryptedBoxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }
}
