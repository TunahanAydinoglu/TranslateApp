import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(TextToSpeechScreen());
}

class TextToSpeechScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text to Speech"),
        ),
        body: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    Future _speak(String text) async {
      await flutterTts.setLanguage("tr-TR");
      await flutterTts.setPitch(0.5);
      print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: textEditingController,
            cursorColor: Colors.orange,
            autofocus: true,
          ),
          SizedBox(
            height: 35,
          ),
          RaisedButton(
            child: Text("Butona bas ve girdiğin yazıyı sese çevir"),
            onPressed: () => _speak(textEditingController.text),
          )
        ],
      ),
    );
  }
}
