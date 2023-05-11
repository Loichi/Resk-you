import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

import 'package:resk_you_mobile/services/models/medicalFolder.dart';

class MedicalFolderInterface {
  String url = 'https://test.api.client.helpp-life.fr/';

  final storage = const FlutterSecureStorage();

/**
 * Methode qui retourne un dossier medical 
 * par rapport au token d'utilisateur qu'on lui donne
 */
  Future<MedicalFolder> getMedicalFolder() async {
    final token = await storage.read(key: "token");

    final response = await http.get(
        Uri.parse('${url}api/users/dossier-medical'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      final MedicalFolder medicalFolder =
          MedicalFolder.fromJson(jsonResponse["dossier_medical"]);
      return medicalFolder;
    } else {
      throw Exception('Failed to load medical folder');
    }
  }

/**
 * Methode qui mets a jour le dossier medical 
 * par rapport au token qu'on lui donne 
 * elle a besoin d'un objet MedicalFolder
 * qui remplacera l'ancien
 */
  Future<http.Response> putMedicalFolder(MedicalFolder medicalFolder) async {
    final token = await storage.read(key: "token");

    final response = await http.put(
        Uri.parse("${url}api/users/dossier-medical"),
        body: jsonEncode(medicalFolder),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          "Content-Type": "application/json"
        });
    return response;
  }
}
