import 'dart:convert';

import 'package:resk_you_mobile/services/models/address.dart';

class Beacon {
  final id;
  final String? idHelpLife;
  // final int lastAckNumber;
  final Address? address;
  final String? appeui;
  final String? appkey;
  final String? classz;
  final String? dateLastAck;
  final String? dateLastCommunication;
  final String? dateMiseEnService;
  final String? deveui;
  final bool? enAlerte;
  final String? etat;
  final String? idUserForWho;
  final double? lat;
  final double? lon;
  // final int lastCommunicationPort;
  // final int niveauBatterie;
  final String? serialNumber;
  final String? organization;
  final String? postcode;
  final bool? proximityOfAgressor;
  final int? rssi;
  final String? selectedService;
  final int? signalLevel;
  final String? skipAlert;
  final String? beaconStatus;
  final String? statutCommercial;
  final bool? surSecteur;
  final String? statutIntervention;
  final String? infoTechniques;
  final String? infoPersonnelles;
  final String? organisationsAssociees;
  final String? telDeclencheur;

  Beacon({
    this.id,
    this.idHelpLife,
    //  this.lastAckNumber,
    this.address,
    this.appeui,
    this.appkey,
    this.classz,
    this.dateLastAck,
    this.dateLastCommunication,
    this.dateMiseEnService,
    this.deveui,
    this.enAlerte,
    this.etat,
    this.idUserForWho,
    this.lat,
    this.lon,
    //  this.lastCommunicationPort,
    //  this.niveauBatterie,
    this.serialNumber,
    this.organization,
    this.postcode,
    this.proximityOfAgressor,
    this.rssi,
    this.selectedService,
    this.signalLevel,
    this.skipAlert,
    this.beaconStatus,
    this.statutCommercial,
    this.surSecteur,
    this.statutIntervention,
    this.infoTechniques,
    this.infoPersonnelles,
    this.organisationsAssociees,
    this.telDeclencheur,
  });

  factory Beacon.fromJson(Map<String, dynamic> json) {
    return Beacon(
      id: json['id'],
      idHelpLife: json['id_helpp_life'],
      // lastAckNumber: int.parse(json['last_ack_number']),
      address: Address.fromJson(json['adresse']),
      appeui: json['appeui'],
      appkey: json['appkey'],
      classz: json['class'],
      dateLastAck: json['date_last_ack'],
      dateLastCommunication: json['date_last_communication'],
      dateMiseEnService: json['date_mise_en_service'],
      deveui: json['deveui'],
      enAlerte: json['en_alerte'],
      etat: json['etat'],
      idUserForWho: json['id_user_for_who'],
      lat: json['lat'],
      lon: json['lon'],
      // lastCommunicationPort: int.parse(json['last_communication_port']),
      // niveauBatterie: int.parse(json['niveau_batterie']),
      serialNumber: json['serial_number'],
      organization: json['organization'],
      postcode: json['postcode'],
      proximityOfAgressor: json['proximity_of_agressor'],
      rssi: json['rssi'],
      selectedService: json['selected_service'],
      signalLevel: json['signal_level'],
      skipAlert: json['skip_alert'],
      beaconStatus: json['balise_status'],
      statutCommercial: json['statut_commercial'],
      surSecteur: json['sur_secteur'],
      statutIntervention: json['statut_intervention'],
      infoTechniques: json['info_techniques'],
      infoPersonnelles: json['info_personnelles'],
      organisationsAssociees: json['organisations_associees'],
      telDeclencheur: json['tel_declencheur'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "idHelpLife": idHelpLife,
        // "lastAckNumber": lastAckNumber,
        "address": address,
        "appeui": appeui,
        "appkey": appkey,
        "classz": classz,
        "dateLastAck": dateLastAck,
        "dateLastCommunication": dateLastCommunication,
        "dateMiseEnService": dateMiseEnService,
        "deveui": deveui,
        "enAlerte": enAlerte,
        "etat": etat,
        "idUserForWho": idUserForWho,
        "lat": lat,
        "lon": lon,
        // "lastCommunicationPort": lastCommunicationPort,
        // "niveauBatterie": niveauBatterie,
        "serialNumber": serialNumber,
        "organization": organization,
        "postcode": postcode,
        "proximityOfAgressor": proximityOfAgressor,
        "rssi": rssi,
        "selectedService": selectedService,
        "signalLevel": signalLevel,
        "skipAlert": skipAlert,
        "baliseStatus": beaconStatus,
        "statutCommercial": statutCommercial,
        "surSecteur": surSecteur,
        "statutIntervention": statutCommercial,
        "infoTechniques": infoTechniques,
        "infoPersonnelles": infoPersonnelles,
        "organisationsAssociees": organisationsAssociees,
        "telDeclencheur": telDeclencheur,
      };
}
