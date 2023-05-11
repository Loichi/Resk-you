import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/unconscious/breathing.dart';
import 'package:resk_you_mobile/components/first_aid/unconscious/check.dart';
import 'package:get/get.dart';

class MainUnconscious extends StatefulWidget {
  const MainUnconscious({super.key});

  @override
  MainUnconsciousState createState() => MainUnconsciousState();
}

class MainUnconsciousState extends State<MainUnconscious> {
  String state = "check";

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
    if (state == "check") page = Check(updateState: changeState);
    if (state == "breathing") page = Breathing(updateState: changeState);
    if (state == "not_breathing") Get.toNamed('/not_breathing');
  }

  MainUnconsciousState();

  @override
  Widget build(BuildContext context) {
    return Container(child: page);
  }
}
