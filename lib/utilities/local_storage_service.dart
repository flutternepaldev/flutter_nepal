import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as en;

///This is where we can have our local _storage service logics
///it's a [singleton] class
class LocalStorageService {
  ///LocalStorage constant keys
  String tokenIdKey = 'BlogAppAdminPanelTokenId';
  String customerInfoKey = 'BlogAppAdminPanelInfoKey';
  late SharedPreferences _getLocalDb;

  // ignore: todo
  //TODO: move it to env_file in PROD env.

  /// a 32 length randomly generated string
  final String _randomString = 'enFjwJpQFjIp3cacG4YI9VXsGQaGQcgp';

  ///[_key] of 32 length is to be used to generate iv for encryption
  late en.Key _key;

  ///[_iv] of defined length eg: 16 is to be used for encryption
  late en.IV _iv;

  /// handles encryption and decryption
  late en.Encrypter _encrypter;

  ///This initializes the local storage service and creates instance of
  ///[LocalStorageService]
  LocalStorageService(SharedPreferences getLocalDb) {
    _getLocalDb = getLocalDb;
    _key = en.Key.fromUtf8(_randomString);
    _iv = en.IV.fromLength(16);

    /// setting [padding] to [null] when initializing [_encrypter]
    /// allows encrypting data of any length eg: 32 bit lenght, 16
    /// bits and multiple of those length.
    _encrypter = en.Encrypter(en.AES(_key, padding: null));
  }

  /// This method reads our local storage by passing [key] of the
  /// storage you're looking for, it only returns only a primitive value.
  Future<String> readValue({required String key}) async {
    try {
      // Read value
      final val = _getLocalDb.getString(key);
      debugPrint('ReadValue:::: EncryptedData: =====> $val');
      var encryptedString = en.Encrypted.fromBase64(val ?? '');

      /// handles decryption of the data [val]
      final decryptedData = _encrypter.decrypt(encryptedString, iv: _iv);
      debugPrint('ReadValue:::: DecryptedData: =====> $decryptedData');
      return decryptedData;
    } on Exception catch (e) {
      debugPrint('LocalDbError: $e');
      rethrow;
    }
  }

  /// This method deletes value by passing [key] of the
  /// value you're deleting,
  Future<void> deleteValue({required String key}) async {
    // Delete value
    try {
      await _getLocalDb.remove(key);
    } on Exception catch (e) {
      debugPrint('LocalDbError: $e');
      rethrow;
    }
  }

  ///This method handles data writing to localStorage, it takes the following
  ///parameters: [key] of [String] type and [value] of Generic Primitive Type.
  ///Note: It only accepts Primitive Types like: [String], [Map], [List],
  /// Find Example of storing a model below:
  ///MyClass myClass = MyClass();
  ///await getIt<LocalStorageService>().writeValue(key: 'MyClass',
  ///value: myClass.toJson());
  Future<void> writeValue<T>(
      {required String key, required Object value}) async {
    try {
      debugPrint('WriteValue::: PlainText Value ========> : $value');

      /// Handles data encryption
      final encryptedVal = _encrypter.encrypt(value.toString(), iv: _iv).base64;
      debugPrint('WriteValue::: Encryped Value ========> : $encryptedVal');
      // Writes to localdb
      await _getLocalDb.setString(key, encryptedVal);
    } on Exception catch (e) {
      debugPrint('LocalDbError: $e');
      rethrow;
    }
  }
}
