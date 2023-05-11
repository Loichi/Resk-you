import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Severity extends StatelessWidget {
  final updateState;

  const Severity({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("La brulure est-elle grave?"),
        SingleClickableText("Oui", updateState, "thermal_check"),
        SingleClickableText("Non", updateState, "small_burn"),
        const SingleBlueClickableText()
      ],
    );
  }
}
