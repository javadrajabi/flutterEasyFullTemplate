
import 'package:encrypt/encrypt.dart';


class AesEncryption{
 static final key = Key.fromUtf8('MySecretKeyForEncryptionAndDecry'); //32 chars
 static final iv = IV.fromUtf8('helloworldhellow'); //16 chars

//   Flutter encryption
  static  String encryp(String text) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
//   print('text : $text');
//   print('encrypted : ${encrypted.base64}');
    return encrypted.base64;
  }

//Flutter decryption
  static String decryp(String text) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
    return decrypted;
  }
}