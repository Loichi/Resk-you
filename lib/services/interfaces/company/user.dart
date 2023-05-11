import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:io';

import 'package:resk_you_mobile/services/models/user.dart';

class UserCompanyInterface {
  String url = 'https://test.api.societe.helpp-life.fr/';

  final storage = const FlutterSecureStorage();

/**
 * Methode permettant de recuperer une liste d'user
 * dans l'api société
 */
  Future<List<User>> fetchUsers() async {
    final token = await storage.read(key: "token");

    final response = await http.get(Uri.parse('${url}api/societe/users'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      List jsonUsers = jsonResponse['users'];

      List<User> users =
          jsonUsers.map((userJson) => User.fromJson(userJson)).toList();
      return users;
    } else {
      throw Exception('Failed to load Users');
    }
  }

/**
 * Methode qui change le mot de passe de l'utilisateur
 * elle a besoin de deux paramettres
 * password et confirm_password
 */
  Future changePassword(password, confirm_password) async {
    final token = await storage.read(key: "token");

    final response = await http.put(
        Uri.parse('${url}api/client/users/password'),
        body: {"password": password, "confirm_password": confirm_password},
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    if (response.statusCode == 200) {
      log('Password updated successfully');
    } else if (response.statusCode == 401) {
      log('Unauthorized: Invalid token');
    } else if (response.statusCode == 500) {
      log('Internal server error');
    } else {
      log('Error: ${response.statusCode}');
    }
  }
}
