import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart' show rootBundle;
final String DEBUG_HOST_URL = "";
final String LOGIN ="";
final String BANNER="";
final String PUBLIC_KEY = "";

Future<String> encode(String text) async{
  String publicKeyString = await rootBundle.loadString('keys/public_key.pem');
  final parser = RSAKeyParser();
  final RSAPublicKey publicKey=parser.parse(publicKeyString);
  final encrypter = Encrypter(RSA(publicKey: publicKey));
  final encrypted = encrypter.encrypt(text);
  return  await encrypted.base64;
}

Future<String> decode(String decoded) async {
  String privateKeyString = await rootBundle.loadString('keys/private_key.pem');
  final parser = RSAKeyParser();
  final privateKey = parser.parse(privateKeyString);
  final encrypter = Encrypter(RSA(privateKey: privateKey));
  return encrypter.decrypt(Encrypted.fromBase64(decoded));
}

String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  // 这里其实就是 digest.toString()
  return hex.encode(digest.bytes);
}

Future<String> createSN(Map param) async{
  String res= await encode("");
  return res;
}