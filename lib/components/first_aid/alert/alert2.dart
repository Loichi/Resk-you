import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/simple_orange_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';

class AlertTwo extends StatelessWidget {
  final updateState;

  const AlertTwo({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SimpleOrangeText("Choisir le service de secours adéquat", 18),
        Image.asset("lib/assets/images/first_aid/service.png", height: 280),
        SingleClickableText("SUITE", updateState, "alert3"),
        DoubleBlueClickableText("Menu l'alerte", updateState, "alert1"),
      ],
    );
  }
}
