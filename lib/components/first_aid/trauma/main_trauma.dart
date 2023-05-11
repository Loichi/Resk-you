import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/trauma/head_back_neck.dart';
import 'package:resk_you_mobile/components/first_aid/trauma/other_trauma.dart';
import 'package:resk_you_mobile/components/first_aid/trauma/trauma_location.dart';

class MainTrauma extends StatefulWidget {
  const MainTrauma({super.key});

  @override
  MainTraumaState createState() => MainTraumaState();
}

class MainTraumaState extends State<MainTrauma> {
  String state = "trauma_location";

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
    // ignore: curly_braces_in_flow_control_structures
    if (state == "trauma_location") {
      page = TraumaLocation(
        updateState: changeState,
      );
    }
    // ignore: curly_braces_in_flow_control_structures
    if (state == "head_back_neck") {
      page = HeadBackNeck(
        updateState: changeState,
      );
    }
    // ignore: curly_braces_in_flow_control_structures
    if (state == "other_trauma") {
      page = OtherTrauma(
        updateState: changeState,
      );
    }
  }

  MainTraumaState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
