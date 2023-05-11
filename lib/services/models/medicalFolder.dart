import 'dart:convert';

import 'allergie.dart';
import 'disease.dart';
import 'hospitalization.dart';
import 'priors.dart';
import 'treatment.dart';

class MedicalFolder {
  final id;
  List<Disease>? diseases;
  List<Hospitalization>? hospitalizations;
  List<Allergie>? allergies;
  List<Priors>? priors;
  List<Treatment>? ongoingTreatment;
  String? bloodGroup;
  bool? deafMute;
  String? handicap;
  String? remark;
  String? publicData;
  String? complementaryInformation;

  /// diseases = maladies
  /// hospitalizations = hospitalisations
  /// priors = antecedents
  /// ongoingTreatment = traitement_en_cours
  /// bloodGroup = groupe_sanguin
  /// deafMute = sourdMuet
  /// handicap = handicap
  /// remark = remarque
  /// publicData = donnees_publiques
  /// complementaryInformation = info_complementaires

  MedicalFolder({
    required this.id,
    this.diseases,
    this.hospitalizations,
    this.allergies,
    this.priors,
    this.ongoingTreatment,
    this.bloodGroup,
    this.deafMute,
    this.handicap,
    this.remark,
    this.publicData,
    this.complementaryInformation,
  });

  MedicalFolder copyWith({
    String? id,
    List<Disease>? diseases,
    List<Hospitalization>? hospitalizations,
    List<Allergie>? allergies,
    List<Priors>? priors,
    List<Treatment>? ongoingTreatment,
    String? bloodGroup,
    bool? deafMute,
    String? handicap,
    String? remark,
    String? publicData,
    String? complementaryInformation,
  }) {
    return MedicalFolder(
      id: id ?? this.id,
      diseases: diseases ?? this.diseases,
      hospitalizations: hospitalizations ?? this.hospitalizations,
      allergies: allergies ?? this.allergies,
      priors: priors ?? this.priors,
      ongoingTreatment: ongoingTreatment ?? this.ongoingTreatment,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      deafMute: deafMute ?? this.deafMute,
      handicap: handicap ?? this.handicap,
      remark: remark ?? this.remark,
      publicData: publicData ?? this.publicData,
      complementaryInformation:
          complementaryInformation ?? this.complementaryInformation,
    );
  }

  factory MedicalFolder.fromJson(Map<String, dynamic> json) {
    return MedicalFolder(
      id: json['id'],
      diseases:
          json['maladies'].map<Disease>((e) => Disease.fromJson(e)).toList(),
      hospitalizations: json['hospitalisations']
          .map<Hospitalization>((e) => Hospitalization.fromJson(e))
          .toList(),
      allergies:
          json['allergies'].map<Allergie>((e) => Allergie.fromJson(e)).toList(),
      priors:
          json['antecedents'].map<Priors>((e) => Priors.fromJson(e)).toList(),
      ongoingTreatment: json['traitement_en_cours']
          .map<Treatment>((e) => Treatment.fromJson(e))
          .toList(),
      bloodGroup: json['groupe_sanguin'],
      deafMute: json['sourd_muet'],
      handicap: json['handicap'],
      remark: json['remarque'],
      publicData: json['donnees_publiques'],
      complementaryInformation: json['info_complementaires'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "maladies": diseases,
      "hospitalisations": hospitalizations,
      "allergies": allergies,
      "antecedents": priors,
      "traitement_en_cours": ongoingTreatment,
      "groupe_sanguin": bloodGroup,
      "sourd_muet": deafMute,
      "handicap": handicap,
      "remarque": remark,
      "donnees_publiques": publicData,
      "info_complementaires": complementaryInformation,
    };
  }
}
