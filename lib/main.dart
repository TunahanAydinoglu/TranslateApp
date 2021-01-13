import 'package:TranslateApp/translate.dart';
import 'package:flutter/material.dart';
import 'text_to_speech.dart';
import 'speech_to_text.dart';
import 'translate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitirme Projesi',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bitirme Projesi Prototipi",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("Speech to Text"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SpeechToTextScreen()));
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("Translator"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TranslateScreen()));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("Text to Speech"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TextToSpeechScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
