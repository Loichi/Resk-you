import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/interfaces/client/qrcode.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  QrCodeState createState() => QrCodeState();
}

class QrCodeState extends State<QrCode> {
  QrCodeInterface qrCode = QrCodeInterface();

  Future getQrCode() async {
    final data = await qrCode.getQrCode();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getQrCode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.memory(
              snapshot.data,
              width: MediaQuery.of(context).size.width * 0.7,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
