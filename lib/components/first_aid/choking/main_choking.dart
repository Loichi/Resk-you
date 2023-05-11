import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/choking/can_talk.dart';
import 'package:resk_you_mobile/components/first_aid/choking/compression.dart';
import 'package:resk_you_mobile/components/first_aid/choking/look_on.dart';
import 'package:resk_you_mobile/components/first_aid/choking/partial_obstruction.dart';
import 'package:resk_you_mobile/components/first_aid/choking/renew_cycle.dart';
import 'package:resk_you_mobile/components/first_aid/choking/total_obstruction.dart';

class MainChoking extends StatefulWidget {
  const MainChoking({super.key});

  @override
  MainChokingState createState() => MainChokingState();
}

class MainChokingState extends State<MainChoking> {
  String state = "can_talk";

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
    if (state == "can_talk") page = CanTalk(updateState: changeState);
    if (state == "partial_obstruction") {
      page = PartialObstruction(updateState: changeState);
    }
    if (state == "total_obstruction") {
      page = TotalObstruction(updateState: changeState);
    }
    if (state == "look_on") page = LookOn(updateState: changeState);
    if (state == "renew_cycle") page = RenewCycle(updateState: changeState);
    if (state == "compression") page = Compression(updateState: changeState);
  }

  MainChokingState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
