import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Disengage extends StatelessWidget {
  final updateState;

  const Disengage({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Dégagement d'urgence possible ? "),
        SingleClickableText("OUI", updateState, "disengageDone"),
        SingleClickableText("NON", updateState, "protect"),
      ],
    );
  }
}
