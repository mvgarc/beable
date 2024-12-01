import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/toefl_vocabulary/tv_intro.dart';


class tvquestion5 extends StatefulWidget {
  tvquestion5({Key? key}) : super(key: key);

  @override
  State<tvquestion5> createState() => _tvquestion5State();
}

class _tvquestion5State extends State<tvquestion5> {
  int selected_step = 0;
  Widget customRadioBorder(int index, {required String text, required String audio}) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {
          context.read<TvIntroInfo>().setTexts5(value5 : text);
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
            child: Image.asset('assets/toefl_vocabulary/intro/question5/tv_question5.png',
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
              customRadioBorder(1, text: "Compel", audio: 'toefl_vocabulary/intro/question5/compel.mp3'),
              customRadioBorder(2, text: "Sharp", audio: 'toefl_vocabulary/intro/question5/sharp.mp3'),    
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customRadioBorder(3, text: "Bequeath", audio: 'toefl_vocabulary/intro/question5/bequeath.mp3'),
              customRadioBorder(4, text: "Deceive", audio: 'toefl_vocabulary/intro/question5/deceive.mp3'),
            ],
          ),
        ],
    );
  }
}