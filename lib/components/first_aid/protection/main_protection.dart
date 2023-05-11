import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/protection/control_victim.dart';
import 'package:resk_you_mobile/components/first_aid/protection/control_witness.dart';
import 'package:resk_you_mobile/components/first_aid/protection/danger.dart';
import 'package:resk_you_mobile/components/first_aid/protection/disengage.dart';
import 'package:resk_you_mobile/components/first_aid/protection/disengage_done.dart';
import 'package:resk_you_mobile/components/first_aid/protection/protect.dart';
import 'package:resk_you_mobile/components/first_aid/protection/suppress.dart';

class MainProtection extends StatefulWidget {
  const MainProtection({super.key});

  @override
  MainProtectionState createState() => MainProtectionState();
}

class MainProtectionState extends State<MainProtection> {
  String state = "danger";

  @override
  initState() {
    super.initState();
    changePage(state);
  }

  var page;

  changeState(String newState) {
    setState(
      () {
        state = newState;
        changePage(state);
      },
    );
  }

  changePage(state) {
    if (state == "danger") page = Danger(updateState: changeState);
    if (state == "controlWitness") {
      page = ControlWitness(updateState: changeState);
    }
    if (state == "controlVictim") {
      page = ControlVictim(updateState: changeState);
    }
    if (state == "suppress") page = Suppress(updateState: changeState);
    if (state == "disengage") page = Disengage(updateState: changeState);
    if (state == "disengageDone") {
      page = DisengageDone(
        updateState: changeState,
      );
    }
    if (state == "protect") page = Protect(updateState: changeState);
  }

  MainProtectionState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
