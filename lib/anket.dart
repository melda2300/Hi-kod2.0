import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  bool _isAdult = false;
  bool _smokes = false;
  int _cigarettesPerDay = 0;
  Gender _gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişilik Anketi'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Adınız ve Soyadınız'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen adınızı ve soyadınızı giriniz';
                }
                return null;
              },
              onSaved: (value) => _name = value!,
            ),
            DropdownButtonFormField<Gender>(
              decoration: InputDecoration(labelText: 'Cinsiyetinizi Seçiniz'),
              value: _gender,
              onChanged: (value) => setState(() => _gender = value!),
              items: Gender.values.map((gender) {
                return DropdownMenuItem<Gender>(
                  value: gender,
                  child: Text(gender == Gender.Male ? 'Erkek' : 'Kadın'),
                );
              }).toList(),
            ),
            CheckboxListTile(
              title: Text('Reşit misiniz?'),
              value: _isAdult,
              onChanged: (value) => setState(() => _isAdult = value!),
            ),
            SwitchListTile(
              title: Text('Sigara kullanıyor musunuz?'),
              value: _smokes,
              onChanged: (value) => setState(() => _smokes = value),
            ),
            _smokes
                ? Slider(
              value: _cigarettesPerDay.toDouble(),
              min: 0,
              max: 20,
              divisions: 20,
              label: 'Günde $_cigarettesPerDay tane sigara',
              onChanged: (value) =>
                  setState(() => _cigarettesPerDay = value.toInt()),
            )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _showResults();
                }
              },
              child: Text('Bilgileri Gönder'),
            ),
          ],
        ),
      ),
    );
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sonuçlar'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Adınız ve Soyadınız: $_name'),
            Text('Cinsiyetiniz: ${_gender == Gender.Male ? 'Erkek' : 'Kadın'}'),
            Text('Reşit misiniz?: ${_isAdult ? 'Evet' : 'Hayır'}'),
            Text('Sigara kullanıyor musunuz?: ${_smokes ? 'Evet' : 'Hayır'}'),
            _smokes
                ? Text('Günde $_cigarettesPerDay tane sigara')
                : Container(),
          ],
        ),
      ),
    );
  }
}

enum Gender { Male, Female }
