import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:translator/translator.dart';
import 'package:TranslateApp/text_to_speech.dart';

class TranslateScreen extends StatefulWidget {
  final String value;
  final String veri;

  TranslateScreen({Key key, this.value, this.veri}) : super(key: key);

  @override
  _TranslateScreen createState() => new _TranslateScreen();
}

class _TranslateScreen extends State<TranslateScreen> {
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
  void initState() {
    super.initState();
    if (widget.value != "") {
      lang.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Translate"),
              SizedBox(
                width: 170,
              ),
              (lang.text != "")
                  ? RaisedButton(
                      child: new Text("Veri gönder"),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TextToSpeechScreen(veri: out.toString())));
                      },
                    )
                  : SizedBox()
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SafeArea(
                        child: Text(
                          'Çevirmek istediğiniz metni giriniz ',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: lang,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      child: Text("Çevir"),
                      onPressed: () {
                        trans();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      (out != null) ? out.toString() : "",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
