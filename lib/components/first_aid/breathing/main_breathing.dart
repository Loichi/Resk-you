import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/breathing/adult.dart';
import 'package:resk_you_mobile/components/first_aid/breathing/baby.dart';
import 'package:resk_you_mobile/components/first_aid/breathing/child.dart';
import 'package:resk_you_mobile/components/first_aid/breathing/not_breating.dart';

class MainBreathing extends StatefulWidget {
  const MainBreathing({super.key});

  @override
  MainBreathingState createState() => MainBreathingState();
}

class MainBreathingState extends State<MainBreathing> {
  String state = "not_breathing";

  @override
  initState() {
    super.initState();
    changePage(state);
  }

  changeState(String newState) {
    setState(
      () {
        state = newState;
        changePage(state);
      },
    );
  }

  var page;

  changePage(state) {
    if (state == "not_breathing") page = NotBreathing(updateState: changeState);
    if (state == "baby") page = Baby(updateState: changeState);
    if (state == "adult") page = Adult(updateState: changeState);
    if (state == "child") page = Child(updateState: changeState);
  }

  MainBreathingState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
