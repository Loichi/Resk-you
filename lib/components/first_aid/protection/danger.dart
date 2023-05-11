import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/no_danger.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Danger extends StatelessWidget {
  final updateState;

  const Danger({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Y a-t-il un danger ? "),
        DoubleText(
            "Le secouriste / Les témoins ", updateState, "controlWitness"),
        DoubleText("La victime ? ", updateState, "controlVictim"),
        const NoDanger(),
        const SingleBlueClickableText(),
      ],
    );
  }
}
