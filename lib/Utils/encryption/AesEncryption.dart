import 'dart:convert';

import 'package:encrypt/encrypt.dart';


class AesEncryption {

  // static String decrypt(String payload) {
  //   String strPwd = "SuperSecretKey";
  //   String strIv = 'SuperSecretBLOCK';
  //   var iv = CryptoPack.sha256.convert(ConvertPack.utf8.encode(strIv)).toString().substring(0, 16);         // Consider the first 16 bytes of all 64 bytes
  //   var key = CryptoPack.sha256.convert(ConvertPack.utf8.encode(strPwd)).toString().substring(0, 32);       // Consider the first 32 bytes of all 64 bytes
  //   EncryptPack.IV ivObj = EncryptPack.IV.fromUtf8(iv);
  //   EncryptPack.Key keyObj = EncryptPack.Key.fromUtf8(key);
  //   final encrypter = EncryptPack.Encrypter(EncryptPack.AES(keyObj, mode: EncryptPack.AESMode.cbc));        // Apply CBC mode
  //   String firstBase64Decoding = new String.fromCharCodes(ConvertPack.base64.decode(payload));              // First Base64 decoding
  //   final decrypted = encrypter.decrypt(EncryptPack.Encrypted.fromBase64(firstBase64Decoding), iv: ivObj);  // Second Base64 decoding (during decryption)
  //   return decrypted;
  // }
  //
  // static String encrypt(String payload) {
  //   String strPwd = "SuperSecretKey";
  //   String strIv = 'SuperSecretBLOCK';
  //   var iv = CryptoPack.sha256.convert(ConvertPack.utf8.encode(strIv)).toString().substring(0, 16);         // Consider the first 16 bytes of all 64 bytes
  //   var key = CryptoPack.sha256.convert(ConvertPack.utf8.encode(strPwd)).toString().substring(0, 32);       // Consider the first 32 bytes of all 64 bytes
  //   EncryptPack.IV ivObj = EncryptPack.IV.fromUtf8(iv);
  //   EncryptPack.Key keyObj = EncryptPack.Key.fromUtf8(key);
  //   final encrypter = EncryptPack.Encrypter(EncryptPack.AES(keyObj, mode: EncryptPack.AESMode.cbc));        // Apply CBC mode
  //   final encrypted = encrypter.encrypt(payload, iv: ivObj);
  //  return encrypted.base64;
  // }

  static final key = Key.fromUtf8('MySecretKeyForEncryptionAndDecry'); //32 chars
  static final iv = IV.fromUtf8('helloworldhellow'); //16 chars

//   Flutter encryption
  static String encrypt(data) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(jsonEncode(data), iv: iv);
//   print('text : $text');
//   print('encrypted : ${encrypted.base64}');
    return encrypted.base64;
  }

//Flutter decryption
  static Map decrypt(data) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(data), iv: iv);
    return jsonDecode(decrypted);
  }

}
