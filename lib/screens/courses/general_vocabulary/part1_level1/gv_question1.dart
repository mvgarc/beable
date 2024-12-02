import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/general_vocabulary/gv_part1_level1.dart';

class gvquestion1 extends StatefulWidget {
  const gvquestion1({super.key});

  @override
  State<gvquestion1> createState() => _gvquestion1State();
}

class _gvquestion1State extends State<gvquestion1> {
  int selected_step = 0;
  Widget customRadioBorder(int index,
      {required String text, required String audio}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<Gv_Part1_Level1Info>().setTexts1(value1: text);
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
              'assets/general_vocabulary/part1_level1/question1/gv_question1.png',
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
                text: "Pay",
                audio: 'general_vocabulary/part1_level1/question1/pay.mp3'),
            customRadioBorder(2,
                text: "Sully",
                audio: 'general_vocabulary/part1_level1/question1/sully.mp3'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customRadioBorder(3,
                text: "Phase",
                audio: 'general_vocabulary/part1_level1/question1/phase.mp3'),
            customRadioBorder(4,
                text: "Trundle",
                audio: 'general_vocabulary/part1_level1/question1/trundle.mp3'),
          ],
        ),
      ],
    );
  }
}
