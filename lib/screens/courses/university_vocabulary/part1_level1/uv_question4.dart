import 'package:audioplayers/audioplayers.dart';
import 'package:beable/providers/university_vocabulary/uv_part1_level1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class uvquestion4 extends StatefulWidget {
  uvquestion4({Key? key}) : super(key: key);

  @override
  State<uvquestion4> createState() => _uvquestion4State();
}

class _uvquestion4State extends State<uvquestion4> {
  int selected_step = 0;
  Widget customRadioBorder(int index, {required String text, required String audio}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<Uv_Part1_Level1Info>().setTexts4(value4 : text);
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
            child: Image.asset('assets/university_vocabulary/part1_level1/question4/uv_question4.png',
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
              customRadioBorder(1, text: "Scholarship", audio: 'university_vocabulary/part1_level1/question4/scholarship.mp3'),
              customRadioBorder(2, text: "Ban", audio: 'university_vocabulary/part1_level1/question4/ban.mp3'),    
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customRadioBorder(3, text: "Beng", audio: 'university_vocabulary/part1_level1/question4/beng.mp3'),
              customRadioBorder(4, text: "Degree", audio: 'university_vocabulary/part1_level1/question4/degree.mp3'),
            ],
          ),
        ],
    );
  }
}