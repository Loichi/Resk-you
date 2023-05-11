import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/alert/alert1.dart';
import 'package:resk_you_mobile/components/first_aid/alert/alert2.dart';
import 'package:resk_you_mobile/components/first_aid/alert/alert3.dart';
import 'package:resk_you_mobile/components/first_aid/alert/alert4.dart';

class MainAlert extends StatefulWidget {
  const MainAlert({super.key});

  @override
  MainAlertState createState() => MainAlertState();
}

class MainAlertState extends State<MainAlert> {
  String state = "alert1";

  changeState(String newState) {
    setState(
      () {
        state = newState;
        changePage(state);
      },
    );
  }

  var page;
  @override
  initState() {
    super.initState();
    changePage(state);
  }

  changePage(state) {
    if (state == "alert1") {
      page = AlertOne(
        updateState: changeState,
      );
    }
    if (state == "alert2") {
      page = AlertTwo(
        updateState: changeState,
      );
    }
    if (state == "alert3") {
      page = AlertThree(
        updateState: changeState,
      );
    }
    if (state == "alert4") {
      page = AlertFour(
        updateState: changeState,
      );
    }
  }

  MainAlertState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
