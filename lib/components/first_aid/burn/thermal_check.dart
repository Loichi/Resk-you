import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class ThermalCheck extends StatelessWidget {
  final updateState;

  const ThermalCheck({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("La brulure est-elle thermique?"),
        SingleClickableText("Oui", updateState, "thermal"),
        SingleClickableText("Non", updateState, "not_thermal"),
        const SingleBlueClickableText()
      ],
    );
  }
}
