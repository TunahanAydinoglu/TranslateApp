import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechScreen extends StatefulWidget {
  final String veri;

  TextToSpeechScreen({Key key, this.veri}) : super(key: key);

  @override
  _TextToSpeechScreen createState() => new _TextToSpeechScreen();
}

class _TextToSpeechScreen extends State<TextToSpeechScreen> {
  final FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.veri != "") {
      textEditingController.text = widget.veri;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future _speak(String text) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(0.5);
      print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }

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
        body: Container(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SafeArea(
                    child: Text(
                      'Seslendirmek istediğiniz metni giriniz ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: textEditingController,
                  cursorColor: Colors.orange,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "Text to Speech",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("Butona bas ve girdiğin yazıyı sese çevir"),
                  onPressed: () => _speak(textEditingController.text),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
