class Priors {
  final id;
  String descriptionPriors;
  String datePriors;

  /// descriptionPriors = description_antecedent
  /// datePriors = date_antecedent

  Priors({
    required this.id,
    required this.descriptionPriors,
    required this.datePriors,
  });

  Priors copyWith({
    String? id,
    String? descriptionPriors,
    String? datePriors,
  }) {
    return Priors(
      id: id ?? this.id,
      descriptionPriors: descriptionPriors ?? this.descriptionPriors,
      datePriors: datePriors ?? this.datePriors,
    );
  }

  factory Priors.fromJson(Map<String, dynamic> json) {
    return Priors(
      id: json['id'],
      descriptionPriors: json['description_antecedent'],
      datePriors: json['date_antecedent'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "description_antecedent": descriptionPriors,
        "date_antecedent": datePriors
      };
}
