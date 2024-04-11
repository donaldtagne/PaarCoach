import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PlayableText extends StatefulWidget {
  @override
  _PlayableTextState createState() => _PlayableTextState();
}

class _PlayableTextState extends State<PlayableText> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  String textToRead = '''
    
 Trennungen sind emotional herausfordernd, auch wenn sie der richtige Schritt sind.
 Der Schmerz des Verlusts, Unsicherheit und manchmal das Gefühl des Versagens begleiten sie. 
 Fragen wie "Hätte ich etwas anders machen können?" tauchen auf. Trennungen sind das Ergebnis vieler Faktoren. 
 Die Zeit danach ermöglicht Selbstreflexion und Wachstum. Trotz anfänglichem Schmerz finden viele einen Weg zur Verarbeitung und zum Lernen. 
 Unterstützung durch Freunde, Familie oder professionelle Hilfe fördert den Heilungsprozess für einen positiven Blick in die Zukunft''';

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (isPlaying) {
          flutterTts.stop();
        } else {
          flutterTts.speak(textToRead);
        }

        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: Icon(
        isPlaying ? Icons.pause_circle_outlined : Icons.play_circle_outlined,
        color: Colors.black,
      ),
    );
  }
  Future<void> speak(String text) async {
    await flutterTts.setLanguage('de-DE');
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(5.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }
}