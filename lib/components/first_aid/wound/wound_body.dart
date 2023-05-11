import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class WoundBody extends StatelessWidget {
  final updateState;

  const WoundBody({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("La plaie est-elle grave ?"),
        SingleClickableText("OUI", updateState, "position_wound"),
        SingleClickableText("NON", updateState, "hygiene"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
