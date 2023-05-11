import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/text_components/simple_text.dart';

class FirstAid extends StatefulWidget {
  const FirstAid({super.key});

  @override
  FirstAidState createState() => FirstAidState();
}

class FirstAidState extends State<FirstAid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const MenuAppBar(),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    const Text(
                      "Premier secours",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Column(
                      children: [
                        SimpleText(
                            "La protection", Colors.red[300]!, "/protection"),
                        SizedBox(height: 10),
                        SimpleText("L'alerte", Colors.orange[300]!, "/alert"),
                        SizedBox(height: 10),
                        SimpleText(
                            "Etouffement", Colors.purple[300]!, "/choking"),
                        SizedBox(height: 10),
                        SimpleText("Saignement abondant", Colors.purple[300]!,
                            "/bleeding"),
                        SizedBox(height: 10),
                        SimpleText("Ne parle pas / inconscient ",
                            Colors.purple[300]!, "/unconscious"),
                        SizedBox(height: 10),
                        SimpleText("Ne respire pas", Colors.purple[300]!,
                            "/not_breathing"),
                        SizedBox(height: 10),
                        SimpleText("Utiliser un defibrilateur",
                            Colors.purple[300]!, "/defibrillator"),
                        SizedBox(height: 10),
                        SimpleText(
                            "Traumatisme", Colors.purple[300]!, "/trauma"),
                        SizedBox(height: 10),
                        SimpleText("Malaise", Colors.purple[300]!, "/malaise"),
                        SizedBox(height: 10),
                        SimpleText("Plaie", Colors.purple[300]!, "/wound"),
                        SizedBox(height: 10),
                        SimpleText("Brulure", Colors.purple[300]!, "/burn"),
                        SizedBox(height: 10),
                        SimpleText("Accident", Colors.green[300]!, "/accident"),
                        SizedBox(height: 10),
                        SimpleText("Incendie", Colors.green[300]!, "/fire"),
                        SizedBox(height: 10),
                        SimpleText(
                            "Avalanche", Colors.green[300]!, "/avalanche"),
                        SizedBox(height: 10),
                        SimpleText("Noyade", Colors.green[300]!, "/drowning"),
                        SizedBox(height: 10),
                        SimpleText("Inondation", Colors.green[300]!, "/flood"),
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}
