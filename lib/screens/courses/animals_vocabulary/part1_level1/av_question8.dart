import 'package:audioplayers/audioplayers.dart';
import 'package:beable/providers/animals_vocabulary/av_part1_level1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class avquestion8 extends StatefulWidget {
  avquestion8({Key? key}) : super(key: key);

  @override
  State<avquestion8> createState() => _avquestion8State();
}

class _avquestion8State extends State<avquestion8> {
  int selected_step = 0;
  Widget customRadioBorder(int index, {required String text, required String audio}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<Av_Part1_Level1Info>().setTexts8(value8 : text);
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
                  child: Text(
                    text,
                    style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontSize: 20,
                    color: selected_step == index ? Colors.blue : Colors.grey,)
                  ),
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
            child: Image.asset('assets/animals_vocabulary/part1_level1/question8/av_question8.png',
            fit: BoxFit.contain),
          ),
          Title(
            color: Colors.black, 
            child: Text('Selecciona la palabra correcta',
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
              customRadioBorder(1, text: "Sheep", audio: 'animals_vocabulary/part1_level1/question8/sheep.mp3'),
              customRadioBorder(2, text: "Bee", audio: 'animals_vocabulary/part1_level1/question8/bee.mp3'),    
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customRadioBorder(3, text: "Kangaroo", audio: 'animals_vocabulary/part1_level1/question8/kangaroo.mp3'),
              customRadioBorder(4, text: "Camel", audio: 'animals_vocabulary/part1_level1/question8/camel.mp3'),
            ],
          ),
        ],
    );
  }
}