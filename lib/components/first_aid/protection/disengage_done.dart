import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_green_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class DisengageDone extends StatelessWidget {
  final updateState;

  const DisengageDone({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        DoubleGreenText("Effectuer le", "dégagement d'urgence"),
        DoubleBlueClickableText("Menu protection", updateState, "danger"),
      ],
    );
  }
}
