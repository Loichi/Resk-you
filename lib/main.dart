import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resk_you_mobile/components/first_aid/alert/alert_frame.dart';
import 'package:resk_you_mobile/components/first_aid/bleeding/bleeding_frame.dart';
import 'package:resk_you_mobile/components/first_aid/breathing/breathing_frame.dart';
import 'package:resk_you_mobile/components/first_aid/burn/burn_frame.dart';
import 'package:resk_you_mobile/components/first_aid/choking/choking_frame.dart';
import 'package:resk_you_mobile/components/first_aid/defibrillator/defibrillator_frame.dart';
import 'package:resk_you_mobile/components/first_aid/protection/protection_frame.dart';
import 'package:resk_you_mobile/components/first_aid/wound/wound_frame.dart';
import 'package:resk_you_mobile/components/first_aid/unconscious/unconscious_frame.dart';
import 'package:resk_you_mobile/components/first_aid/malaise/malaise_frame.dart';
import 'package:resk_you_mobile/components/first_aid/trauma/trauma_frame.dart';
import 'package:resk_you_mobile/screens/beacons.dart';
import 'package:resk_you_mobile/screens/call_view.dart';
import 'package:resk_you_mobile/screens/beacon_detail_view.dart';
import 'package:resk_you_mobile/screens/emergency_contact.dart';
import 'package:resk_you_mobile/screens/first_aid.dart';
import 'package:resk_you_mobile/screens/first_login.dart';
import 'package:resk_you_mobile/screens/home.dart';
import 'package:resk_you_mobile/screens/login.dart';
import 'package:resk_you_mobile/screens/medical_view.dart';
import 'package:resk_you_mobile/screens/my_tag.dart';
import 'package:resk_you_mobile/screens/profil_view.dart';
import 'package:resk_you_mobile/screens/rescue_view.dart';
import 'package:resk_you_mobile/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'MyPolice',
        ),
        initialRoute: '/login',
        getPages: [
          GetPage(
            name: '/first_login',
            page: () => FirstLogIn(),
          ),
          GetPage(
            name: '/login',
            page: () => const LogInView(),
          ),
          GetPage(
            name: '/rescue',
            page: () => const RescueView(),
          ),
          GetPage(
            name: '/profil',
            page: () => const ProfilView(),
          ),
          GetPage(
            name: '/splash',
            page: () => const Splash(),
          ),
          GetPage(
            name: '/call',
            page: () => const CallView(),
          ),
          GetPage(
            name: '/emergency_contact',
            page: () => const EmergencyContactView(),
          ),
          GetPage(
            name: '/detail_balise',
            page: () => BeaconDetailView(),
          ),
          GetPage(
            name: '/balises',
            page: () => const BeaconsView(),
          ),
          GetPage(
            name: '/my_tag',
            page: (() => const MyTagView()),
          ),
          GetPage(
            name: '/home',
            page: () => const Home(),
          ),
          GetPage(
            name: '/first_aid',
            page: () => const FirstAid(),
          ),
          GetPage(
            name: '/protection',
            page: () => const ProtectionFrame(),
          ),
          GetPage(
            name: '/bleeding',
            page: () => const BleedingFrame(),
          ),
          GetPage(name: '/not_breathing', page: () => const BreathingFrame()),
          GetPage(name: '/alert', page: (() => const AlertFrame())),
          GetPage(name: '/unconscious', page: (() => const UnconsciousFrame())),
          GetPage(
              name: '/defibrillator', page: () => const DefibrillatorFrame()),
          GetPage(name: '/malaise', page: () => const MalaiseFrame()),
          GetPage(name: '/trauma', page: () => const Traumaframe()),
          GetPage(name: '/wound', page: (() => const WoundFrame())),
          GetPage(name: '/not_breathing', page: () => const BreathingFrame()),
          GetPage(name: '/alert', page: (() => const AlertFrame())),
          GetPage(name: '/unconscious', page: (() => const UnconsciousFrame())),
          GetPage(
              name: '/defibrillator', page: () => const DefibrillatorFrame()),
          GetPage(name: '/malaise', page: () => const MalaiseFrame()),
          GetPage(name: '/trauma', page: () => const Traumaframe()),
          GetPage(
            name: '/choking',
            page: () => const ChokingFrame(),
          ),
          GetPage(
            name: '/burn',
            page: () => const BurnFrame(),
          ),
          GetPage(
            name: '/medical_folder',
            page: () => const MedicalView(),
          ),
        ]);
  }
}
