import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class CanTalk extends StatelessWidget {
  final updateState;

  const CanTalk({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("La personne peut parler?"),
        SingleClickableText("Oui", updateState, "partial_obstruction"),
        SingleClickableText("Non", updateState, "total_obstruction"),
        const SingleBlueClickableText()
      ],
    );
  }
}
