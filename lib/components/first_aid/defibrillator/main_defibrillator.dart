import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/defibrillator/can_shock.dart';
import 'package:resk_you_mobile/components/first_aid/defibrillator/heart_massage.dart';
import 'package:resk_you_mobile/components/first_aid/defibrillator/shocking.dart';


class MainDefibrillator extends StatefulWidget {
  const MainDefibrillator({super.key});

  @override
  MainDefibrillatorState createState() => MainDefibrillatorState();
}

class MainDefibrillatorState extends State<MainDefibrillator> {
  String state = "can_shock";

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
    if (state == "can_shock") {
      page = CanShock(
        updateState: changeState,
      );
    }
    if (state == "heart_massage") {
      page = HeartMassage(
        updateState: changeState,
      );
    }
    if (state == "shocking") {
      page = Shocking(
        updateState: changeState,
      );
    }
  }

  MainDefibrillatorState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
