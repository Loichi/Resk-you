import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class ControlVictim extends StatelessWidget {
  final updateState;

  const ControlVictim({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Est-il contrôlable?"),
        SingleClickableText("Oui", updateState, "suppress"),
        SingleClickableText("Non", updateState, "disengage"),
      ],
    );
  }
}
