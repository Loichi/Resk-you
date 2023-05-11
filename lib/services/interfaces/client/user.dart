import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:resk_you_mobile/services/models/user.dart';
import 'package:http_parser/http_parser.dart';

class UserClientInterface {
  String url = 'https://test.api.client.helpp-life.fr/';

  final storage = const FlutterSecureStorage();

/**
 * Methode qui permet de recuperer toutes les informations
 * d'un utilisateur en foction du tken qu'on lui donne
 */
  Future<User> getUserProfil() async {
    final token = await storage.read(key: "token");

    final response = await http.get(Uri.parse('${url}api/users/profil'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      User user = User.fromJson(jsonResponse['user']);

      return user;
    } else {
      throw Exception('Failed to load Users');
    }
  }

/**
 * Methode qui mets a jour l'user 
 * par rapport au token qu'on lui donne 
 * elle a besoin d'un objet User
 */
  Future<http.Response> putUserProfil(User userData) async {
    final token = await storage.read(key: "token");
    final user = jsonEncode(userData.toJson());

    var response = await http
        .put(Uri.parse("${url}api/users/profil"), body: user, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json"
    });
    return response;
  }

  Future changePassword(password, confirmPassword) async {
    final token = await storage.read(key: "token");

    final response = await http.put(
        Uri.parse('${url}api/client/users/password'),
        body: {"password": password, "confirm_password": confirmPassword},
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    if (response.statusCode == 200) {
      print('Password updated successfully');
    } else if (response.statusCode == 401) {
      print('Unauthorized: Invalid token');
    } else if (response.statusCode == 500) {
      print('Internal server error');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  /// getPicture va chercher dans l'api rest si une image est trouvable via la route indiquée
  Future getPicture() async {
    final token = await storage.read(key: "token");

    final response = await http.get(
        Uri.parse(
            'https://test.api.societe.helpp-life.fr/api/client/users/dossier-medical/photo/4'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;

      return bytes;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid token');
    } else if (response.statusCode == 500) {
      throw Exception('Internal server error');
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to load picture');
    }
  }

  /// envoie d'une image à un endpoint de l'API en utilisant http.MultiPartRequest
  /// token ajouté dans le header de la requête. Ajout du fichier de l'image en utilisant la méthode
  /// fromBytes qui prend 3 arguments : le champ, la value et le nom du fichier (en l'occurence, son chemin)
  /// puis stockage de la requête dans la response, si le statusCode est 204 alors return de la response
  /// sinon log du fail avec le statusCode de la response ou catch de l'erreur rencontrée.
  ///
  Future<String?> postPicture(File file) async {
    final token = await storage.read(key: "token");

    final request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://test.api.societe.helpp-life.fr/api/client/users/dossier-medical/photo/4'));

    request.headers.addAll({'Authorization': 'Bearer $token'});

    request.files.add(http.MultipartFile.fromBytes(
      'photo',
      File(file.path).readAsBytesSync(),
      filename: file.path,
    ));
    try {
      final response = await request.send();
      if (response.statusCode == 204) {
        return response.reasonPhrase;
      } else {
        log('Failed tu upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error uploading image: $e');
    }

    return null;
  }
}
