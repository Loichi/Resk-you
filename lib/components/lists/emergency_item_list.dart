import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/models/contact.dart';

class EmergencyListItem extends StatefulWidget {
  //variable qui va recuperer un string afin de savoir quel icone l'on va utiliser
  Contact contact;

  EmergencyListItem(this.contact, {super.key});

  @override
  EmergencyListItemState createState() => EmergencyListItemState();
}

class EmergencyListItemState extends State<EmergencyListItem> {
  @override
  void initState() {
    super.initState();
    roadToInitial(widget.contact.lastname, widget.contact.firstname);
  }

  //methode qui va permettre de creer le logo avec les initiales du contact
  late var initials;
  roadToInitial(String nom, String prenom) {
    String lastName = nom;
    String firstName = prenom;

    if (lastName != "") {
      initials = lastName.substring(0, 1);
    }
    if (firstName != "") {
      initials += firstName.substring(0, 1);
    }
  }

  callContact(contactTelephone) {
    final parsedNumber = Uri.parse("tel:$contactTelephone");
    launchUrl(parsedNumber);
  }

  UserClientInterface userClientInterface = UserClientInterface();

  @override
  Widget build(BuildContext context) => Column(children: [
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            callContact(widget.contact.telephone);
          },
          child: Row(children: [
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.amber[100],
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  initials,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 25),
            Column(children: [
              SizedBox(
                width: 100,
                child: Text(
                    "${widget.contact.lastname} ${widget.contact.firstname}"),
              ),
              SizedBox(
                width: 100,
                child: Text(widget.contact.telephone),
              ),
            ]),
            const SizedBox(width: 20),
            if (widget.contact.contactPro == true)
              const SizedBox(
                  width: 30,
                  child: Text(
                    "PRO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            if (widget.contact.contactPro == false) const SizedBox(width: 30),
            const SizedBox(width: 30),
            const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
          ]),
        ),
        const SizedBox(height: 10)
      ]);
}
