import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'form.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SimpleFormPage(), // เปลี่ยนจาก HomePage เป็น SimpleFormPage
  ));
}

class MyApp extends StatelessWidget {
  final String qrData = 'https://chananchidaakkarakit.github.io/my-flutter-web/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('QR Code ตัวอย่าง')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(height: 20),
              Text('สแกน QR ด้านบนเพื่อเข้าสู่เว็บไซต์'),
            ],
          ),
        ),
      ),
    );
  }
}
