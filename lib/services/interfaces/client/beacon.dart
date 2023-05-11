// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
import '../../models/beacon.dart';

class BeaconClientInterface {
  String url = 'https://test.api.client.helpp-life.fr/';

  final storage = const FlutterSecureStorage();

/**
 * Methode qui retourne une liste de Beacon
 * Par rapport au token qu'elle recupere dans le local storage
 */

  Future<List<Beacon>> getBeacons() async {
    final token = await storage.read(key: "token");

    final response = await http.get(Uri.parse('${url}api/balises'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var jsonBalises = jsonResponse['balises'];
      var jsonAddress = jsonResponse['adresse'];

      List<Beacon> beacons = jsonResponse['balises']
          .map((e) => Beacon.fromJson(e))
          .cast<Beacon>()
          .toList();

      return beacons;
    } else {
      throw Exception('Failed to load Users');
    }
  }

/**
 * Methode qui retourne le nom d'une balise en fonction 
 * de l'id de balise qu'on lui donne
 */
  Future getBeaconName(String idBeacon) async {
    final token = await storage.read(key: "token");

    final response = await http.get(
        Uri.parse(
            'https://test.api.societe.helpp-life.fr/api/client/balises/update-id-perso/$idBeacon'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      var jsonName = jsonResponse['id_perso'];

      return jsonName;
    } else {
      throw Exception('Failed to load name of beacon');
    }
  }

/**
 * Methode qui permet de mettre a jour le nom d'une balise
 * elle a besoin de deux paramettres
 * L'id de la balise
 * Le nouveau nom de balise
 */
  Future updateBeaconName(String idBeacon, String updatedName) async {
    final token = await storage.read(key: "token");

    final response = await http.put(
        Uri.parse(
            'https://test.api.societe.helpp-life.fr/api/client/balises/update-id-perso/${idBeacon}/${updatedName}'),
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    if (response.statusCode == 200) {
      print('name updated successfully');
    }
    if (response.statusCode == 200) {
      print('name updated successfully');
    } else if (response.statusCode == 401) {
      print('Unauthorized: Invalid token');
    } else if (response.statusCode == 500) {
      print('Internal server error');
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
