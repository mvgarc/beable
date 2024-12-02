import 'package:audioplayers/audioplayers.dart';
import 'package:beable/providers/animals_vocabulary/av_part1_level1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class avquestion7 extends StatefulWidget {
  const avquestion7({super.key});

  @override
  State<avquestion7> createState() => _avquestion7State();
}

class _avquestion7State extends State<avquestion7> {
  int selected_step = 0;
  Widget customRadioBorder(int index,
      {required String text, required String audio}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<Av_Part1_Level1Info>().setTexts7(value7: text);
          setState(() => selected_step = index);
          final player = AudioPlayer();
          player.play(AssetSource(audio));
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: selected_step == index ? Colors.blue : Colors.black38,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 120,
          width: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(text,
                      style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 20,
                        color:
                            selected_step == index ? Colors.blue : Colors.grey,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: Image.asset(
              'assets/animals_vocabulary/part1_level1/question7/av_question7.png',
              fit: BoxFit.contain),
        ),
        Title(
          color: Colors.black,
          child: Text(
            'Selecciona la palabra correcta',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customRadioBorder(1,
                text: "Swan",
                audio: 'animals_vocabulary/part1_level1/question7/swan.mp3'),
            customRadioBorder(2,
                text: "Crab",
                audio: 'animals_vocabulary/part1_level1/question7/crab.mp3'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customRadioBorder(3,
                text: "Otter",
                audio: 'animals_vocabulary/part1_level1/question7/otter.mp3'),
            customRadioBorder(4,
                text: "Bat",
                audio: 'animals_vocabulary/part1_level1/question7/bat.mp3'),
          ],
        ),
      ],
    );
  }
}
