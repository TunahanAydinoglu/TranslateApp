import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(Translate());
}

class Translate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TranslateScreen(),
    );
  }
}

class TranslateScreen extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<TranslateScreen> {
  GoogleTranslator translator = new GoogleTranslator();

  String out;
  final lang = TextEditingController();
  void trans() {
    translator.translate(lang.text, to: 'en').then((output) {
      print(output);
      setState(() {
        out = output.toString();
      });
      print(out);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Wrap(
              children: <Widget>[
                SafeArea(
                  child: Text(
                    'Çevirmek istediğiniz metni giriniz ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextField(
                  controller: lang,
                  style: TextStyle(fontSize: 20),
                  autofocus: true,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    RaisedButton(
                      color: Colors.blueGrey,
                      child: Text("Çevir"),
                      onPressed: () {
                        trans();
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      (out != null) ? out.toString() : "",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
