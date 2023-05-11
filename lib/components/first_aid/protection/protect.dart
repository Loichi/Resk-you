import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_green_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Protect extends StatelessWidget {
  final updateState;

  const Protect({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        DoubleGreenText("Proteger la zone", "Exemple: Balisage"),
        DoubleBlueClickableText("Menu protection", updateState, "danger"),
      ],
    );
  }
}
