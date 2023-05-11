import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/simple_orange_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Suppress extends StatelessWidget {
  final updateState;

  const Suppress({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        SimpleOrangeText("Supprimer le danger", 18),
        DoubleBlueClickableText("Menu Protection", updateState, "danger"),
      ],
    );
  }
}
