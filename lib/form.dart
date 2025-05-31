import 'package:flutter/material.dart';

class SimpleFormPage extends StatefulWidget {
  @override
  _SimpleFormPageState createState() => _SimpleFormPageState();
}

class _SimpleFormPageState extends State<SimpleFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';
  String _result = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _result = 'คุณกรอกชื่อ: $_firstName\nนามสกุล: $_lastName';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ฟอร์มกรอกชื่อ-นามสกุล')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'ชื่อ'),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? 'กรุณากรอกชื่อ' : null,
                    onSaved: (value) => _firstName = value ?? '',
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'นามสกุล'),
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'กรุณากรอกนามสกุล'
                        : null,
                    onSaved: (value) => _lastName = value ?? '',
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('ส่งข้อมูล'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Text(
                _result,
                style: TextStyle(fontSize: 18, color: Colors.green[700]),
              ),
          ],
        ),
      ),
    );
  }
}
