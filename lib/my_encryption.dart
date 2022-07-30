import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptionDecryption {
  /**
   * for AES Encryption / Decryption
   */
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypterAES = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypterAES.encrypt(text, iv: iv);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  static decryptAES(text) {
    final decrypted = encrypterAES.decrypt(text, iv: iv);
    return decrypted;
  }

  /**
   * for Fernet Encryption / Decryption
   */
  static final keyFernet =
      encrypt.Key.fromUtf8('TechWithVPIsBestTechWithVPIsBest');
  static final fernet = encrypt.Fernet(keyFernet);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encryptFernet(text) {
    final encrypted = encrypterFernet.encrypt(text);

    print(fernet.extractTimestamp(encrypted.bytes)); // unix timestamp
    return encrypted;
  }

  static decryptFernet(text) {
    return encrypterFernet.decrypt(text);
  }

  // For Salsa20 Encryption/Decryption
  static final keySalsa20 = encrypt.Key.fromLength(32);
  static final ivSalsa20 = encrypt.IV.fromLength(8);
  static final encrypteSalsa20 = encrypt.Encrypter(encrypt.Salsa20(keySalsa20));

  static encryptSalsa20(text) {
    final encrypted = encrypteSalsa20.encrypt(text, iv: ivSalsa20);
    // print(encrypted.bytes);
    // print(encrypted.base16);
    // print(encrypted.base64);
    return encrypted;
  }

  static decryptSalsa20(text) {
    return encrypteSalsa20.decrypt(text, iv: ivSalsa20);
  }
}
