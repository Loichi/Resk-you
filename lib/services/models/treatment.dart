class Treatment {
  final id;
  String ongoingTreatment;

  /// ongoingTreatment = descriptionTraitement_en_cours

  Treatment({required this.id, required this.ongoingTreatment});

  Treatment copyWith({
    String? id,
    String? ongoingTreatment,
  }) {
    return Treatment(
      id: id ?? this.id,
      ongoingTreatment: ongoingTreatment ?? this.ongoingTreatment,
    );
  }

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
        id: json['id'],
        ongoingTreatment: json['description_traitement_en_cours']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description_traitement_en_cours": ongoingTreatment,
      };
}
