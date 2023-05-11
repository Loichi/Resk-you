import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

class QrCodeInterface {
  String url = 'https://test.api.societe.helpp-life.fr/';

  final storage = const FlutterSecureStorage();

/**
 * Methode qui recupere le QrCode par rapport a un token
 */
  Future getQrCode() async {
    final token = await storage.read(key: "token");

    final response = await http.get(
        Uri.parse('${url}api/client/users/dossier-medical/photo/0'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    final bytes = response.bodyBytes;

    return bytes;
  }
}
